import 'package:flutter/material.dart';

class KnowledgeRatingCard extends StatefulWidget {
  final String title;
  final List<String> areas;
  final Map<String, int> ratings;
  final Function(String, int) onRatingChanged;
  final VoidCallback onContinue;

  const KnowledgeRatingCard({
    super.key,
    required this.title,
    required this.areas,
    required this.ratings,
    required this.onRatingChanged,
    required this.onContinue,
  });

  @override
  State<KnowledgeRatingCard> createState() => _KnowledgeRatingCardState();
}

class _KnowledgeRatingCardState extends State<KnowledgeRatingCard> {
  bool get allRated => widget.areas.every((area) => widget.ratings[area] != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '1 = No knowledge, 5 = Excellent',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.builder(
              itemCount: widget.areas.length,
              itemBuilder: (context, index) {
                final area = widget.areas[index];
                final rating = widget.ratings[area] ?? 0;
                return _buildRatingRow(area, rating);
              },
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: allRated ? widget.onContinue : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: allRated ? const Color(0xFF22C55E) : Colors.grey.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                allRated ? 'Continue' : 'Rate all areas to continue',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: allRated ? Colors.white : Colors.white60,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingRow(String area, int currentRating) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: currentRating > 0
              ? const Color(0xFF22C55E).withValues(alpha: 0.3)
              : Colors.white.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            area,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(5, (index) {
              final value = index + 1;
              final isSelected = currentRating == value;
              return GestureDetector(
                onTap: () => widget.onRatingChanged(area, value),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? _getRatingColor(value)
                        : Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? _getRatingColor(value)
                          : Colors.white.withValues(alpha: 0.2),
                      width: isSelected ? 2 : 1,
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: _getRatingColor(value).withValues(alpha: 0.4),
                              blurRadius: 8,
                            ),
                          ]
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      '$value',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : Colors.white70,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Color _getRatingColor(int rating) {
    switch (rating) {
      case 1:
        return Colors.red.shade600;
      case 2:
        return Colors.orange.shade600;
      case 3:
        return Colors.amber.shade600;
      case 4:
        return Colors.lightGreen.shade600;
      case 5:
        return const Color(0xFF22C55E);
      default:
        return Colors.grey;
    }
  }
}
