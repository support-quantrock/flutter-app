'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/fonts/MaterialIcons-Regular.otf": "3971ee02560bd782dd45fb6348c63d38",
"assets/AssetManifest.bin": "a69f0f1b1e126614242b0b182eaffdbe",
"assets/assets/videos/lessons/day2/lesson3/story_animation.mp4": "48ada6b279bac2d06f60b8bebba5c7c0",
"assets/assets/videos/lessons/day2/lesson4/story_animation.mp4": "3ded860b3b8d34494fce9e4ecbb467a0",
"assets/assets/videos/lessons/day2/lesson1/story_animation.mp4": "541ca36972b1837942e7520d0110f2f0",
"assets/assets/videos/lessons/day2/lesson5/story_animation.mp4": "d7b569193f2e0b4fb76ea234878dc9b5",
"assets/assets/videos/lessons/day2/lesson2/story_animation.mp4": "b247f5d2e60a0d9f58f38a0df63bf811",
"assets/assets/images/mascot.png": "22829ff7a7222adf78a72275f31879e5",
"assets/assets/images/qiqt_hero.png": "257eb05e8b88ae33243b11d40cd2e602",
"assets/assets/images/logo.png": "0a4dc3d88bb30155bcc75729faea9c99",
"assets/assets/images/lessons/day12/lesson3/game1.png": "f28d73d27d27ab9b03b1c466811c6019",
"assets/assets/images/lessons/day12/lesson3/content2.png": "cc98ee58540a05d67bc6000849666cfd",
"assets/assets/images/lessons/day12/lesson3/game2.png": "9c541407da2fe7b3d698d30da7957fef",
"assets/assets/images/lessons/day12/lesson3/mission.png": "c1734cdb580a71b421895e848d37993b",
"assets/assets/images/lessons/day12/lesson3/question.png": "64d67f3d144b63b92f67dac8be5e5f5d",
"assets/assets/images/lessons/day12/lesson3/story.png": "a15402c4ca77e20a4b89159cfc2cfa72",
"assets/assets/images/lessons/day12/lesson3/content1.png": "47d67c38ce9f82b7c6f8da82289e64bd",
"assets/assets/images/lessons/day12/lesson4/story.png": "fe749ae43053e35fc02e36892f196742",
"assets/assets/images/lessons/day12/lesson1/game1.png": "9721652b0dbe04a2f5809db93d637ee6",
"assets/assets/images/lessons/day12/lesson1/content2.png": "703611c5667e1551e936cb05da37b1b1",
"assets/assets/images/lessons/day12/lesson1/game2.png": "8090ce348fa6fb1a2959ed02e04414a4",
"assets/assets/images/lessons/day12/lesson1/mission.png": "c4e334c577b679c1b764f77fbff86d44",
"assets/assets/images/lessons/day12/lesson1/question.png": "04ccb36f840263bfb75c2c537842cdba",
"assets/assets/images/lessons/day12/lesson1/story.png": "54032a09e613f81099a08c9370cd4ce6",
"assets/assets/images/lessons/day12/lesson1/content1.png": "f685bbd6c72ce5bab6b412bda6f3a669",
"assets/assets/images/lessons/day12/lesson2/game1.png": "3248d023ffefcdc1539d03e4a064f1e5",
"assets/assets/images/lessons/day12/lesson2/content2.png": "21600532f47cb5438bba16e2ea1d80cd",
"assets/assets/images/lessons/day12/lesson2/game2.png": "7f6025576702865f06a3fd2bfaaa6254",
"assets/assets/images/lessons/day12/lesson2/mission.png": "a4f388d8b33b8f09fd3907d555fcec3a",
"assets/assets/images/lessons/day12/lesson2/question.png": "af70943eb322fd93506bcf8ebfa71cbe",
"assets/assets/images/lessons/day12/lesson2/story.png": "6876d2bb0d8fa72ae107000b3738de89",
"assets/assets/images/lessons/day12/lesson2/content1.png": "af4f4d6406afcbf4e1665c304ce24c9a",
"assets/assets/images/lessons/day11/lesson3/game1.png": "8be66b82742b1daa58fdcbfb2e66d866",
"assets/assets/images/lessons/day11/lesson3/content2.png": "010735ce708db749420c802ffa92d661",
"assets/assets/images/lessons/day11/lesson3/game2.png": "d3372a4326f0b2e5f4efd1fea5ac87a3",
"assets/assets/images/lessons/day11/lesson3/mission.png": "ab3bfdf78cddef4dffcae3faf50a66aa",
"assets/assets/images/lessons/day11/lesson3/question.png": "c5cbb4f300cb391a0e8696d2cda80ed4",
"assets/assets/images/lessons/day11/lesson3/story.png": "a338f7452e7d947853b35f0dee87f934",
"assets/assets/images/lessons/day11/lesson3/content1.png": "25ea0476163f50b42c293eca7bd2ddfa",
"assets/assets/images/lessons/day11/lesson4/game1.png": "2bfb078c1deac2782760d6aa73e3a9ae",
"assets/assets/images/lessons/day11/lesson4/content2.png": "eec43d0ffddd16d081fba6d3c4b443dd",
"assets/assets/images/lessons/day11/lesson4/game2.png": "d7df48dfef6d17560b9c3758c2a6609e",
"assets/assets/images/lessons/day11/lesson4/mission.png": "c121e30ed40105c01d687046ad2fcce9",
"assets/assets/images/lessons/day11/lesson4/question.png": "89c60824304461848ffa09e08381465d",
"assets/assets/images/lessons/day11/lesson1/content2.png": "e31a8e702673b16729e4a887fd93503a",
"assets/assets/images/lessons/day11/lesson1/game2.png": "bc0be3419521e695ba7441d790113eb3",
"assets/assets/images/lessons/day11/lesson1/question.png": "bdf49ffcdca4e3e0935ba20c136e2985",
"assets/assets/images/lessons/day11/lesson1/story.png": "dcf8f47c034be005128ee9ae0ce5391b",
"assets/assets/images/lessons/day11/test/q4.png": "0bf5ca58c6323c68e406a670c5717753",
"assets/assets/images/lessons/day11/test/q5.png": "74062ade5b08f45666f2e3eabdc59c86",
"assets/assets/images/lessons/day11/test/q2.png": "443ab7ab88a3367ef1ae4379e11e1748",
"assets/assets/images/lessons/day11/test/q1.png": "eb0fd053cc8028d45577da4a402b52c3",
"assets/assets/images/lessons/day11/test/q3.png": "69d738ef64fb17c312d52f5c77162d3d",
"assets/assets/images/lessons/day11/lesson5/game1.png": "00b578bb4154cc943377fc7baf0c218c",
"assets/assets/images/lessons/day11/lesson5/content2.png": "262c7386a6d9b87d28f2a18192427383",
"assets/assets/images/lessons/day11/lesson5/game2.png": "cf00a09be783ce98d57ab192ca270938",
"assets/assets/images/lessons/day11/lesson5/question.png": "e68d0cd8ad375a3ec0c99754c640b2e2",
"assets/assets/images/lessons/day11/lesson5/story.png": "4647a8f6a534e9b6fb671d401aa3365d",
"assets/assets/images/lessons/day11/lesson5/content1.png": "35c7c8a79ff2e12c98ba0b3c4a97422b",
"assets/assets/images/lessons/day11/lesson2/game1.png": "ab8c4eb42d587ec86a791d45166d75a0",
"assets/assets/images/lessons/day11/lesson2/content2.png": "81e924d867f818c3c14ee9bec28eba3c",
"assets/assets/images/lessons/day11/lesson2/question.png": "5c529dcd6b51aab3581f83f36b27ef32",
"assets/assets/images/lessons/day11/lesson2/content1.png": "01f62e4e52205ae912877bf67ea1c485",
"assets/assets/images/lessons/day10/lesson3/game1.png": "a49985406c1cda02fa4f3085f793a6ff",
"assets/assets/images/lessons/day10/lesson3/content2.png": "b18173e6e0ac80ad2974d510c8390ba5",
"assets/assets/images/lessons/day10/lesson3/game2.png": "061f581b0d07547ce3923716c56ed42f",
"assets/assets/images/lessons/day10/lesson3/mission.png": "8b1de619db4adaf225f5c48d91ac0983",
"assets/assets/images/lessons/day10/lesson3/question.png": "0bf075552aaa613698bac05f688cc284",
"assets/assets/images/lessons/day10/lesson3/story.png": "a4e014a504268e28c50d32680a55c968",
"assets/assets/images/lessons/day10/lesson3/content1.png": "71ac7ed0ce494dfc5647377fe3117c1b",
"assets/assets/images/lessons/day10/lesson4/game1.png": "fc0c94655e75322a68b48e695d81642c",
"assets/assets/images/lessons/day10/lesson4/content2.png": "54edbd326e5a20218cae5d95fbbce22a",
"assets/assets/images/lessons/day10/lesson4/game2.png": "49a982560635cbedb4e068f6821d203d",
"assets/assets/images/lessons/day10/lesson4/mission.png": "018624979f0b9555c9dbddef35c6f4f1",
"assets/assets/images/lessons/day10/lesson4/question.png": "bfc764ac5c16f0c5c3e189fb9772b82e",
"assets/assets/images/lessons/day10/lesson4/story.png": "f31211e12fa2a92979eab666f5be9058",
"assets/assets/images/lessons/day10/lesson4/content1.png": "494cb9f076fe423892e116dfbdc6bbce",
"assets/assets/images/lessons/day10/lesson1/game1.png": "a801c562e0ef2b06445e3a1eb26ccf21",
"assets/assets/images/lessons/day10/lesson1/content2.png": "11aa5ebcec345e7945364841a85ef3da",
"assets/assets/images/lessons/day10/lesson1/game2.png": "7d52611a10ab3b484fc7342563afd439",
"assets/assets/images/lessons/day10/lesson1/mission.png": "0bbaa7cb5fb6911bed11d2a5c4dbf105",
"assets/assets/images/lessons/day10/lesson1/question.png": "7c3b1d794a736d165f96c195e81bc7d0",
"assets/assets/images/lessons/day10/lesson1/story.png": "2c601aa656235d869b9c6c148b640034",
"assets/assets/images/lessons/day10/lesson1/content1.png": "e826f325dde9e74921ee71b010db085d",
"assets/assets/images/lessons/day10/test/q4.png": "8994a773bb048bdf5d36164d2f11d9d0",
"assets/assets/images/lessons/day10/test/q5.png": "bfbc6db4046135d5df3abc1fc1ef7d49",
"assets/assets/images/lessons/day10/test/q2.png": "07d2d732b83ce96c2cadaf88a34bcbb1",
"assets/assets/images/lessons/day10/test/q1.png": "b5235b0e88f688e991b8aa15edb63fcb",
"assets/assets/images/lessons/day10/test/q3.png": "14ac0c29e1cb2e53be54b52a710b42ce",
"assets/assets/images/lessons/day10/lesson5/game1.png": "ac5a68a4ecdc3c7147f38e459f0d3444",
"assets/assets/images/lessons/day10/lesson5/content2.png": "52d7533ac43d5efc2f06febdcf5ce208",
"assets/assets/images/lessons/day10/lesson5/game2.png": "0d35d07019551e0b7acfe95e068b28f7",
"assets/assets/images/lessons/day10/lesson5/mission.png": "e46357cdf65f0adcc90def31508d2d72",
"assets/assets/images/lessons/day10/lesson5/story.png": "84ca819b0a08f4a1ebab31a559db771f",
"assets/assets/images/lessons/day10/lesson2/game1.png": "445f814c12c165c4ae10c0e31d5f4313",
"assets/assets/images/lessons/day10/lesson2/content2.png": "61d2b40793734ae05c57d8ee9dd22ad7",
"assets/assets/images/lessons/day10/lesson2/game2.png": "360402a763a3de6145074237289405b2",
"assets/assets/images/lessons/day10/lesson2/mission.png": "7e32769edf8d2efa50ea64a0bde8a87a",
"assets/assets/images/lessons/day10/lesson2/question.png": "77285c3101f0e4bfb84bbc8bb406e6fc",
"assets/assets/images/lessons/day10/lesson2/story.png": "b033d350205717b1fccfae8d717c92c6",
"assets/assets/images/lessons/day10/lesson2/content1.png": "3eae118eb8595fa8f9bcde7450198a8b",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.json": "38eb7110bd5324e1f4d5c8b6e61f21eb",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/NOTICES": "9e3c7bda778f14d104e80eb4ccb0d5ce",
"assets/AssetManifest.bin.json": "3747d47a1e577431592a5790fb878755",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"index.html": "461ea0ba76df527babd16c414d0d441e",
"/": "461ea0ba76df527babd16c414d0d441e",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"version.json": "389a6e6e6f34312743ca5f36467c84b5",
"main.dart.js": "16c1a3c588ddefd872978ccf6aabca39",
"manifest.json": "56128fc6ec7568b99d6fc24cfa34a218",
"flutter_bootstrap.js": "4bfbd74738ad197b270890f67f55d147",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"favicon.png": "5dcef449791fa27946b3d35ad8803796"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
