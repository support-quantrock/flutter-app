import 'dart:math';
import 'package:flutter/material.dart';
import '../../models/lesson_models.dart';
import '../../services/sound_service.dart';

enum GameType { balloon, swipe, spinner, quickTap }

class GameScreen extends StatefulWidget {
  final LessonScreen screen;
  final VoidCallback onContinue;
  final void Function(bool isCorrect)? onAnswerResult;

  const GameScreen({
    super.key,
    required this.screen,
    required this.onContinue,
    this.onAnswerResult,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with TickerProviderStateMixin {
  late GameType _gameType;
  late AnimationController _glowController;
  late AnimationController _particleController;
  late AnimationController _confettiController;
  late Animation<double> _glowAnimation;

  // Balloon game state
  late List<AnimationController> _floatControllers;
  late List<AnimationController> _shakeControllers;
  int? _selectedIndex;
  bool _showConfetti = false;
  int _wrongIndex = -1;

  // Swipe game state
  late AnimationController _swipeController;
  double _swipeOffset = 0;

  // Spinner game state
  late AnimationController _spinController;
  double _spinAngle = 0;
  bool _isSpinning = false;
  int _spinResult = -1;

  // Quick tap game state
  late AnimationController _timerController;
  int _timeRemaining = 10;
  bool _answered = false;

  @override
  void initState() {
    super.initState();

    // Randomly select game type based on option count
    final optionCount = widget.screen.gameData?.options.length ?? 2;
    _gameType = _selectGameType(optionCount);

    _glowController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );

    _particleController = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    )..repeat();

    _confettiController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Initialize game-specific controllers
    _initBalloonGame(optionCount);
    _initSwipeGame();
    _initSpinnerGame();
    _initQuickTapGame();
  }

  GameType _selectGameType(int optionCount) {
    final random = Random();
    if (optionCount == 2) {
      // Binary choice - use swipe or quick tap
      return random.nextBool() ? GameType.swipe : GameType.quickTap;
    } else {
      // Multiple options - use balloon or spinner
      return random.nextBool() ? GameType.balloon : GameType.spinner;
    }
  }

  void _initBalloonGame(int optionCount) {
    _floatControllers = List.generate(optionCount, (index) {
      return AnimationController(
        duration: Duration(milliseconds: 1500 + index * 200),
        vsync: this,
      )..repeat(reverse: true);
    });

    _shakeControllers = List.generate(optionCount, (index) {
      return AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
      );
    });
  }

  void _initSwipeGame() {
    _swipeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  void _initSpinnerGame() {
    _spinController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
  }

  void _initQuickTapGame() {
    _timerController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );

    if (_gameType == GameType.quickTap) {
      _timerController.forward();
      _timerController.addListener(() {
        final newTime = (10 * (1 - _timerController.value)).ceil();
        if (newTime != _timeRemaining && mounted) {
          setState(() {
            _timeRemaining = newTime;
          });
        }
      });
      _timerController.addStatusListener((status) {
        if (status == AnimationStatus.completed && !_answered) {
          // Time's up - wrong answer
          _handleAnswer(-1, false);
        }
      });
    }
  }

  @override
  void dispose() {
    _glowController.dispose();
    _particleController.dispose();
    _confettiController.dispose();
    for (var c in _floatControllers) {
      c.dispose();
    }
    for (var c in _shakeControllers) {
      c.dispose();
    }
    _swipeController.dispose();
    _spinController.dispose();
    _timerController.dispose();
    super.dispose();
  }

  void _handleAnswer(int index, bool isCorrect) {
    if (_selectedIndex != null || _answered) return;

    _answered = true;

    if (isCorrect) {
      SoundService().playBoom();
      widget.onAnswerResult?.call(true);
      setState(() {
        _selectedIndex = index;
        _showConfetti = true;
      });
      _confettiController.forward();

      Future.delayed(const Duration(milliseconds: 1500), () {
        if (mounted) widget.onContinue();
      });
    } else {
      SoundService().playBeep();
      setState(() {
        _wrongIndex = index;
      });

      if (_gameType == GameType.balloon && index >= 0) {
        _shakeControllers[index].forward(from: 0).then((_) {
          if (mounted) {
            setState(() {
              _wrongIndex = -1;
              _answered = false;
            });
          }
        });
      } else {
        Future.delayed(const Duration(milliseconds: 800), () {
          if (mounted) {
            setState(() {
              _wrongIndex = -1;
              _answered = false;
            });
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final gameData = widget.screen.gameData;
    if (gameData == null) {
      return const Center(child: Text('No game data'));
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1E3A5F),
            const Color(0xFF0F172A),
            const Color(0xFF1A1A2E).withValues(alpha: 0.9),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Animated particles
          ...List.generate(15, (index) => _buildParticle(index)),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 60, 16, 20),
              child: Column(
                children: [
                  // Game header
                  _buildHeader(),

                  const SizedBox(height: 16),

                  // Instruction
                  _buildInstruction(gameData),

                  const SizedBox(height: 20),

                  // Game area based on type
                  Expanded(
                    child: _buildGameArea(gameData),
                  ),

                  const SizedBox(height: 12),

                  // Hint text
                  _buildHint(),
                ],
              ),
            ),
          ),

          // Confetti overlay
          if (_showConfetti) _buildConfetti(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    final gameEmoji = {
      GameType.balloon: '🎈',
      GameType.swipe: '👆',
      GameType.spinner: '🎰',
      GameType.quickTap: '⚡',
    };

    final gameName = {
      GameType.balloon: 'Pop Challenge',
      GameType.swipe: 'Swipe Decision',
      GameType.spinner: 'Spin to Win',
      GameType.quickTap: 'Quick Tap',
    };

    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple.withValues(alpha: 0.3),
                Colors.purple.withValues(alpha: 0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.purple.withValues(alpha: 0.5 * _glowAnimation.value),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withValues(alpha: 0.2 * _glowAnimation.value),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(gameEmoji[_gameType]!, style: const TextStyle(fontSize: 24)),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  widget.screen.title ?? gameName[_gameType]!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (_gameType == GameType.quickTap) ...[
                const SizedBox(width: 12),
                _buildTimer(),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildTimer() {
    final color = _timeRemaining <= 3 ? Colors.red : Colors.amber;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.timer, color: color, size: 16),
          const SizedBox(width: 4),
          Text(
            '$_timeRemaining',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInstruction(GameData gameData) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        gameData.instruction,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white.withValues(alpha: 0.9),
          height: 1.4,
        ),
      ),
    );
  }

  Widget _buildGameArea(GameData gameData) {
    switch (_gameType) {
      case GameType.balloon:
        return _buildBalloonGame(gameData);
      case GameType.swipe:
        return _buildSwipeGame(gameData);
      case GameType.spinner:
        return _buildSpinnerGame(gameData);
      case GameType.quickTap:
        return _buildQuickTapGame(gameData);
    }
  }

  Widget _buildHint() {
    final hints = {
      GameType.balloon: 'Tap the correct balloon!',
      GameType.swipe: 'Swipe left or right to choose!',
      GameType.spinner: 'Tap to spin and find the answer!',
      GameType.quickTap: 'Answer quickly before time runs out!',
    };

    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: 0.5 + (0.5 * _glowAnimation.value),
          child: Text(
            hints[_gameType]!,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.7),
              fontStyle: FontStyle.italic,
            ),
          ),
        );
      },
    );
  }

  // ==================== BALLOON GAME ====================
  Widget _buildBalloonGame(GameData gameData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(gameData.options.length, (index) {
        return Flexible(
          child: _buildBalloon(index, gameData.options[index], gameData),
        );
      }),
    );
  }

  Widget _buildBalloon(int index, GameOption option, GameData gameData) {
    final isPopped = _selectedIndex == index;
    final isWrong = _wrongIndex == index;
    final colors = [Colors.red, Colors.blue, Colors.green, Colors.orange, Colors.purple];
    final color = colors[index % colors.length];

    final screenWidth = MediaQuery.of(context).size.width;
    final totalCount = gameData.options.length;
    final availableWidth = (screenWidth - 40) / totalCount;
    final balloonSize = (availableWidth * 0.7).clamp(50.0, 80.0);
    final labelWidth = (availableWidth - 8).clamp(60.0, 100.0);

    return AnimatedBuilder(
      animation: _floatControllers[index],
      builder: (context, child) {
        final floatOffset = sin(_floatControllers[index].value * pi) * 8;

        Widget balloon = Transform.translate(
          offset: Offset(0, floatOffset),
          child: GestureDetector(
            onTap: () => _handleAnswer(index, index == gameData.correctIndex),
            child: AnimatedScale(
              scale: isPopped ? 0 : 1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: balloonSize,
                    height: balloonSize * 1.15,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        center: const Alignment(-0.3, -0.3),
                        colors: [
                          color.withValues(alpha: 0.9),
                          color,
                          color.withValues(alpha: 0.7),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(balloonSize / 2),
                      boxShadow: [
                        BoxShadow(
                          color: color.withValues(alpha: 0.4),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(option.emoji, style: TextStyle(fontSize: balloonSize * 0.4)),
                    ),
                  ),
                  Container(width: 2, height: 15, color: Colors.white.withValues(alpha: 0.5)),
                  const SizedBox(height: 4),
                  Container(
                    width: labelWidth,
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      option.label,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        if (isWrong) {
          return AnimatedBuilder(
            animation: _shakeControllers[index],
            builder: (context, child) {
              final shake = sin(_shakeControllers[index].value * pi * 8) * 10;
              return Transform.translate(
                offset: Offset(shake, 0),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcATop),
                  child: balloon,
                ),
              );
            },
          );
        }

        return balloon;
      },
    );
  }

  // ==================== SWIPE GAME ====================
  Widget _buildSwipeGame(GameData gameData) {
    if (gameData.options.length < 2) return const SizedBox();

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (_answered) return;
        setState(() {
          _swipeOffset += details.delta.dx;
        });
      },
      onHorizontalDragEnd: (details) {
        if (_answered) return;
        if (_swipeOffset.abs() > 100) {
          // Swipe completed
          final swipedRight = _swipeOffset > 0;
          // Left swipe = first option, Right swipe = second option
          final selectedIndex = swipedRight ? 1 : 0;
          _handleAnswer(selectedIndex, selectedIndex == gameData.correctIndex);
        } else {
          // Reset position
          setState(() {
            _swipeOffset = 0;
          });
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Swipe indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSwipeIndicator(gameData.options[0], false),
              _buildSwipeIndicator(gameData.options[1], true),
            ],
          ),

          const SizedBox(height: 30),

          // Swipeable card
          Transform.translate(
            offset: Offset(_swipeOffset, 0),
            child: Transform.rotate(
              angle: _swipeOffset * 0.001,
              child: Container(
                width: 250,
                height: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.purple.withValues(alpha: 0.4),
                      Colors.blue.withValues(alpha: 0.3),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: _swipeOffset < -50
                        ? Colors.red
                        : _swipeOffset > 50
                            ? Colors.green
                            : Colors.white.withValues(alpha: 0.3),
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withValues(alpha: 0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('❓', style: TextStyle(fontSize: 60)),
                    const SizedBox(height: 20),
                    const Text(
                      'Swipe to choose',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.arrow_back, color: Colors.white54),
                        const SizedBox(width: 20),
                        const Icon(Icons.arrow_forward, color: Colors.white54),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwipeIndicator(GameOption option, bool isRight) {
    return Container(
      width: 80,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: (isRight ? Colors.green : Colors.red).withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: (isRight ? Colors.green : Colors.red).withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        children: [
          Text(option.emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(height: 4),
          Text(
            option.label,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // ==================== SPINNER GAME ====================
  Widget _buildSpinnerGame(GameData gameData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _isSpinning ? null : () => _startSpin(gameData),
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.purple.withValues(alpha: 0.3),
                  Colors.blue.withValues(alpha: 0.2),
                ],
              ),
              border: Border.all(color: Colors.amber, width: 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.amber.withValues(alpha: 0.3),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Spinner segments
                Transform.rotate(
                  angle: _spinAngle,
                  child: CustomPaint(
                    size: const Size(240, 240),
                    painter: SpinnerPainter(
                      options: gameData.options,
                      selectedIndex: _spinResult,
                    ),
                  ),
                ),
                // Center button
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.amber.withValues(alpha: 0.5),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Icon(
                    _isSpinning ? Icons.hourglass_empty : Icons.play_arrow,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                // Pointer
                Positioned(
                  top: 0,
                  child: Container(
                    width: 20,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 24),

        if (!_isSpinning && _spinResult == -1)
          AnimatedBuilder(
            animation: _glowAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: 0.95 + (0.05 * _glowAnimation.value),
                child: const Text(
                  'Tap to spin!',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
      ],
    );
  }

  void _startSpin(GameData gameData) {
    if (_isSpinning) return;

    setState(() {
      _isSpinning = true;
      _spinResult = -1;
    });

    final random = Random();
    final targetIndex = gameData.correctIndex;
    final segmentAngle = (2 * pi) / gameData.options.length;
    final targetAngle = -targetIndex * segmentAngle - segmentAngle / 2;
    final totalRotation = (3 + random.nextInt(3)) * 2 * pi + targetAngle;

    final startAngle = _spinAngle;
    _spinController.reset();
    _spinController.addListener(() {
      setState(() {
        _spinAngle = startAngle + totalRotation * Curves.easeOutCubic.transform(_spinController.value);
      });
    });

    _spinController.forward().then((_) {
      setState(() {
        _isSpinning = false;
        _spinResult = targetIndex;
      });

      Future.delayed(const Duration(milliseconds: 500), () {
        _handleAnswer(targetIndex, true);
      });
    });
  }

  // ==================== QUICK TAP GAME ====================
  Widget _buildQuickTapGame(GameData gameData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Timer progress bar
        Container(
          width: double.infinity,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(4),
          ),
          child: AnimatedBuilder(
            animation: _timerController,
            builder: (context, child) {
              return FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: 1 - _timerController.value,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: _timeRemaining <= 3
                          ? [Colors.red, Colors.orange]
                          : [Colors.amber, Colors.green],
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 30),

        // Options as large buttons
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(gameData.options.length, (index) {
              return _buildQuickTapOption(index, gameData.options[index], gameData);
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickTapOption(int index, GameOption option, GameData gameData) {
    final isSelected = _selectedIndex == index;
    final isWrong = _wrongIndex == index;
    final colors = [Colors.blue, Colors.green, Colors.purple, Colors.orange];
    final color = colors[index % colors.length];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: GestureDetector(
        onTap: () => _handleAnswer(index, index == gameData.correctIndex),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isSelected
                  ? [Colors.green, Colors.green.withValues(alpha: 0.7)]
                  : isWrong
                      ? [Colors.red, Colors.red.withValues(alpha: 0.7)]
                      : [color.withValues(alpha: 0.3), color.withValues(alpha: 0.15)],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? Colors.green
                  : isWrong
                      ? Colors.red
                      : color.withValues(alpha: 0.5),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: (isSelected ? Colors.green : isWrong ? Colors.red : color)
                    .withValues(alpha: 0.3),
                blurRadius: 15,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            children: [
              Text(option.emoji, style: const TextStyle(fontSize: 32)),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  option.label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (isSelected)
                const Icon(Icons.check_circle, color: Colors.green, size: 28)
              else if (isWrong)
                const Icon(Icons.cancel, color: Colors.red, size: 28),
            ],
          ),
        ),
      ),
    );
  }

  // ==================== SHARED WIDGETS ====================
  Widget _buildParticle(int index) {
    final random = Random(index);
    final size = 2.0 + random.nextDouble() * 4;
    final left = random.nextDouble() * MediaQuery.of(context).size.width;
    final startTop = random.nextDouble() * MediaQuery.of(context).size.height;
    final colors = [Colors.purple, Colors.blue, Colors.amber, Colors.white];

    return AnimatedBuilder(
      animation: _particleController,
      builder: (context, child) {
        final progress = (_particleController.value + index * 0.06) % 1.0;
        final top = startTop - (progress * 280);

        return Positioned(
          left: left,
          top: top,
          child: Opacity(
            opacity: (1 - progress) * 0.5,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors[random.nextInt(colors.length)],
                boxShadow: [
                  BoxShadow(
                    color: colors[random.nextInt(colors.length)].withValues(alpha: 0.5),
                    blurRadius: size * 2,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildConfetti() {
    return AnimatedBuilder(
      animation: _confettiController,
      builder: (context, child) {
        return Stack(
          children: List.generate(50, (index) {
            final random = Random(index);
            final startX = random.nextDouble() * MediaQuery.of(context).size.width;
            final endX = startX + (random.nextDouble() - 0.5) * 200;
            final progress = _confettiController.value;
            final x = startX + (endX - startX) * progress;
            final y = -50 + progress * (MediaQuery.of(context).size.height + 100);
            final rotation = progress * pi * 4 * (random.nextBool() ? 1 : -1);
            final colors = [Colors.red, Colors.blue, Colors.green, Colors.yellow, Colors.purple, Colors.orange, Colors.pink];

            return Positioned(
              left: x,
              top: y,
              child: Opacity(
                opacity: 1 - progress * 0.5,
                child: Transform.rotate(
                  angle: rotation,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: colors[random.nextInt(colors.length)],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

// Custom painter for spinner segments
class SpinnerPainter extends CustomPainter {
  final List<GameOption> options;
  final int selectedIndex;

  SpinnerPainter({required this.options, this.selectedIndex = -1});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;
    final segmentAngle = (2 * pi) / options.length;
    final colors = [Colors.red, Colors.blue, Colors.green, Colors.orange, Colors.purple];

    for (int i = 0; i < options.length; i++) {
      final startAngle = i * segmentAngle - pi / 2;
      final paint = Paint()
        ..color = colors[i % colors.length].withValues(alpha: i == selectedIndex ? 0.8 : 0.5)
        ..style = PaintingStyle.fill;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        segmentAngle,
        true,
        paint,
      );

      // Draw segment border
      final borderPaint = Paint()
        ..color = Colors.white.withValues(alpha: 0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        segmentAngle,
        true,
        borderPaint,
      );

      // Draw emoji in segment
      final midAngle = startAngle + segmentAngle / 2;
      final textRadius = radius * 0.65;
      final textX = center.dx + textRadius * cos(midAngle);
      final textY = center.dy + textRadius * sin(midAngle);

      final textPainter = TextPainter(
        text: TextSpan(
          text: options[i].emoji,
          style: const TextStyle(fontSize: 24),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(textX - textPainter.width / 2, textY - textPainter.height / 2),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
