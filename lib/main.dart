import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(const PonselMartApp());

// ---------- DATA ----------
class Product {
  final String name, brand, spec, kondisi, lokasi;
  final int price, oldPrice, terjual;
  final double rating;
  final Color c1, c2;
  const Product(this.name, this.brand, this.spec, this.price, this.oldPrice,
      this.rating, this.terjual, this.kondisi, this.lokasi, this.c1, this.c2);
  // Foto produk: taruh file di assets/images/ dengan nama seperti ini
  String get asset => 'assets/images/${name.toLowerCase().replaceAll(' ', '_')}.png';
}

// ---------- MOCK DATA ----------
const teamData = [
  ('Javier', 'Pemilik & CEO', 5),
  ('Mas Amba', 'Kepala Gudang', 12),
  ('Mas Azrie;', 'Customer Service', 47),
];
const testimoni = [
  ('Budi S.', 'Barang sampai cepat, HP sesuai deskripsi. Mantap!', 5),
  ('Citra L.', 'Penjualnya ramah dan garansi jelas. Pasti beli lagi.', 5),
  ('Andi W.', 'Harga paling murah dibanding toko lain di kota saya.', 4),
];
const stats = [('12rb+', 'Pelanggan'), ('500+', 'Produk'), ('4,8', 'Rating'), ('25', 'Kota')];
const faqs = [
  ('Apakah ada garansi?', 'Semua HP baru bergaransi resmi 1 tahun. HP bekas bergaransi toko 30 hari.'),
  ('Berapa lama pengiriman?', 'Kota besar 1-2 hari, daerah lain 3-5 hari kerja.'),
  ('Apakah bisa COD?', 'Bisa untuk wilayah tertentu. Hubungi kami lewat WhatsApp.'),
];

const products = [
  Product('Galaxy A55 5G', 'Samsung', '8/256 GB · AMOLED 120Hz', 5499000, 5999000, 4.8, 1240, 'Baru', 'Jakarta', Color(0xFF4C6FFF), Color(0xFF1B2A6B)),
  Product('Redmi Note 13 Pro', 'Xiaomi', '8/256 GB · Kamera 200MP', 3799000, 4299000, 4.7, 3012, 'Baru', 'Surabaya', Color(0xFFFF9A4D), Color(0xFFB53C00)),
  Product('iPhone 13 128 GB', 'Apple', 'Bekas · Baterai 91%', 7650000, 0, 4.9, 518, 'Bekas', 'Bandung', Color(0xFFE9ECF5), Color(0xFF8791AD)),
  Product('Reno 11F 5G', 'OPPO', '8/256 GB · Charge 67W', 4299000, 4799000, 4.6, 870, 'Baru', 'Surabaya', Color(0xFF35D6A5), Color(0xFF0B7A5C)),
  Product('Poco X6 Pro', 'Xiaomi', '12/512 GB · Dimensity 8300', 4999000, 5499000, 4.8, 1620, 'Baru', 'Semarang', Color(0xFFFFE14D), Color(0xFF6D5B00)),
  Product('Vivo V30e', 'Vivo', '8/256 GB · Kamera Aura Light', 4699000, 0, 4.5, 402, 'Baru', 'Malang', Color(0xFFC06BFF), Color(0xFF4A1A8A)),
  Product('Galaxy S21 FE', 'Samsung', 'Bekas · 8/256 GB', 4350000, 0, 4.7, 296, 'Bekas', 'Jakarta', Color(0xFF8FB3FF), Color(0xFF2A3F7A)),
  Product('Infinix Note 40', 'Infinix', '8/256 GB · Charge 70W', 2799000, 3199000, 4.5, 2210, 'Baru', 'Surabaya', Color(0xFFFF6B8B), Color(0xFF8A1738)),
    Product('iPhone 15 128 GB', 'Apple', '128 GB · Dynamic Island · USB-C', 12999000, 13999000, 4.9, 860, 'Baru', 'Jakarta', Color(0xFFF6D9DE), Color(0xFFC98F9C)),
  Product('Galaxy S24', 'Samsung', '8/256 GB · Galaxy AI · AMOLED 120Hz', 11999000, 12999000, 4.8, 640, 'Baru', 'Surabaya', Color(0xFFC3B2F0), Color(0xFF6B55B8)),
  Product('Realme 12 Pro 5G', 'Realme', '8/256 GB · Kamera Periskop', 5299000, 5799000, 4.7, 920, 'Baru', 'Bandung', Color(0xFF8BE0AE), Color(0xFF2E8B63)),
  Product('OPPO A3', 'OPPO', '6/128 GB · Baterai 5100mAh', 2499000, 0, 4.5, 1480, 'Baru', 'Malang', Color(0xFF8DBBFF), Color(0xFF2F5DC4)),
  Product('Redmi 13C', 'Xiaomi', '6/128 GB · Layar 90Hz', 1799000, 1999000, 4.4, 3320, 'Baru', 'Semarang', Color(0xFF454B59), Color(0xFF10131A)),
  Product('iPhone 11 64 GB', 'Apple', 'Bekas · Baterai 85%', 3950000, 0, 4.6, 275, 'Bekas', 'Surabaya', Color(0xFFE2D8F5), Color(0xFF9C86CF)),
];

String rp(int x) {
  final s = x.toString();
  final b = StringBuffer('Rp');
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) b.write('.');
    b.write(s[i]);
  }
  return b.toString();
}

// ---------- APP ----------
class PonselMartApp extends StatelessWidget {
  const PonselMartApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ponsel Mart',
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: const Color(0xFF1F3BFF)),
        darkTheme: ThemeData(useMaterial3: true, brightness: Brightness.dark, colorSchemeSeed: const Color(0xFF1F3BFF)),
        themeMode: ThemeMode.system,
        home: const Shell(),
      );
}

class Shell extends StatefulWidget {
  const Shell({super.key});
  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  int page = 0;
  final Map<int, int> cart = {};
  int get count => cart.values.fold(0, (a, b) => a + b);
  static const titles = ['Beranda', 'Produk', 'About Me', 'Tentang Kami', 'Kontak', 'Pesanan'];

  void snack(String t) => ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(t), duration: const Duration(seconds: 1)));

  void add(int i) {
    setState(() => cart[i] = (cart[i] ?? 0) + 1);
    snack('${products[i].name} masuk keranjang');
  }

  void change(int i, int d) => setState(() {
        final n = (cart[i] ?? 0) + d;
        if (n <= 0) {
          cart.remove(i);
        } else {
          cart[i] = n;
        }
      });

  void openCheckout() {
    Navigator.of(context).push(slideRoute(CheckoutPage(
      cart: Map.of(cart),
      onPlaced: (o) {
        setState(() {
          cart.clear();
          page = 5;
        });
        snack('Pesanan ${o.id} dibuat. Silakan lakukan pembayaran.');
      },
    )));
  }

  void openCart() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => StatefulBuilder(builder: (ctx, setS) {
        final ids = cart.keys.toList();
        final total = ids.fold<int>(0, (s, i) => s + products[i].price * cart[i]!);
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Keranjang', style: Theme.of(ctx).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
              if (ids.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text('Keranjang kosong. Pilih HP lalu tekan Tambah.'),
                ),
              for (final i in ids)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(products[i].name),
                  subtitle: Text(rp(products[i].price)),
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    IconButton(icon: const Icon(Icons.remove_circle_outline), onPressed: () { change(i, -1); setS(() {}); }),
                    Text('${cart[i]}', style: const TextStyle(fontWeight: FontWeight.w700)),
                    IconButton(icon: const Icon(Icons.add_circle_outline), onPressed: () { change(i, 1); setS(() {}); }),
                  ]),
                ),
              const Divider(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Total', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
                Text(rp(total), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
              ]),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: ids.isEmpty
                      ? null
                      : () {
                          Navigator.pop(ctx);
                          openCheckout();
                        },
                  child: const Text('Checkout'),
                ),
              ),
            ]),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      BerandaPage(onAdd: add, onSeeAll: () => setState(() => page = 1)),
      ProdukPage(onAdd: add),
      const AboutPage(),
      const TentangPage(),
      KontakPage(onGoProduk: () => setState(() => page = 1)),
      PesananPage(onGoProduk: () => setState(() => page = 1)),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[page], style: const TextStyle(fontWeight: FontWeight.w800)),
        actions: [
          IconButton(
            onPressed: openCart,
            icon: Badge(
              isLabelVisible: count > 0,
              label: Text('$count'),
              child: const Icon(Icons.shopping_cart_outlined),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      // Tombol menu (hamburger) otomatis muncul di AppBar karena ada drawer
      drawer: Drawer(
        child: SafeArea(
          child: Column(children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xFF1F3BFF), Color(0xFF4B1FFF)]),
              ),
              child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(Icons.smartphone, color: Colors.white, size: 40),
                SizedBox(height: 8),
                Text('Ponsel Mart', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
                Text('Marketplace HP', style: TextStyle(color: Colors.white70)),
              ]),
            ),
            for (final m in [
              (0, Icons.home_outlined, 'Beranda'),
              (1, Icons.phone_android, 'Produk'),
              (5, Icons.receipt_long_outlined, 'Pesanan'),
              (2, Icons.person_outline, 'About Me'),
              (3, Icons.storefront_outlined, 'Tentang Kami'),
              (4, Icons.contact_phone_outlined, 'Kontak'),
            ])
              ListTile(
                leading: Icon(m.$2),
                title: Text(m.$3),
                selected: page == m.$1,
                onTap: () {
                  Navigator.pop(context);
                  setState(() => page = m.$1);
                },
              ),
          ]),
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, anim) => FadeTransition(
          opacity: anim,
          child: SlideTransition(
            position: Tween<Offset>(begin: const Offset(0.04, 0), end: Offset.zero).animate(anim),
            child: child,
          ),
        ),
        child: KeyedSubtree(key: ValueKey(page), child: pages[page]),
      ),
    );
  }
}

// ---------- KOMPONEN ----------
class PhoneArt extends StatelessWidget {
  final Product p;
  const PhoneArt(this.p, {super.key});
  @override
  Widget build(BuildContext context) => Container(
        width: 52,
        height: 94,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [p.c1, p.c2]),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF0B0F1A), width: 3),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 12, offset: Offset(0, 6))],
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.all(5),
            width: 16,
            height: 16,
            decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(5)),
          ),
        ),
      );
}

class ProductCard extends StatelessWidget {
  final Product p;
  final VoidCallback onAdd;
  const ProductCard({super.key, required this.p, required this.onAdd});
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [p.c1.withAlpha(60), p.c2.withAlpha(90)]),
          ),
          child: Stack(children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(p.asset, height: 112, fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => PhoneArt(p)),
              ),
            ),
            if (p.oldPrice > 0)
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(color: const Color(0xFFFFD23F), borderRadius: BorderRadius.circular(6)),
                  child: Text('-${(100 - p.price / p.oldPrice * 100).round()}%',
                      style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 12, color: Colors.black)),
                ),
              ),
          ]),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(p.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w800)),
              Text(p.spec, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12, color: t.colorScheme.onSurfaceVariant)),
              const SizedBox(height: 6),
              Text(rp(p.price), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17)),
              if (p.oldPrice > 0)
                Text(rp(p.oldPrice), style: TextStyle(fontSize: 12, decoration: TextDecoration.lineThrough, color: t.colorScheme.onSurfaceVariant)),
              const SizedBox(height: 4),
              Text('★ ${p.rating} · ${p.terjual} terjual · ${p.kondisi} · ${p.lokasi}',
                  maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 11, color: t.colorScheme.onSurfaceVariant)),
              const Spacer(),
              SizedBox(width: double.infinity, child: FilledButton(onPressed: onAdd, child: const Text('Tambah'))),
            ]),
          ),
        ),
      ]),
    );
  }
}

// ---------- HALAMAN ----------
class BerandaPage extends StatelessWidget {
  final void Function(int) onAdd;
  final VoidCallback onSeeAll;
  const BerandaPage({super.key, required this.onAdd, required this.onSeeAll});
  @override
  Widget build(BuildContext context) {
    final title = Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800);
    final promo = [for (var i = 0; i < products.length; i++) if (products[i].oldPrice > 0) i];
    final brands = {for (final p in products) p.brand};
    return ListView(padding: const EdgeInsets.all(16), children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(children: [
          const Positioned.fill(child: NetImg('https://picsum.photos/seed/ponselmart/900/500')),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xE61F3BFF), Color(0xB34B1FFF)]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('HP baru dan bekas dari penjual terpercaya',
                  style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800, height: 1.2)),
              const SizedBox(height: 8),
              const Text('Bandingkan harga, pilih merek favorit, lalu masukkan ke keranjang.',
                  style: TextStyle(color: Colors.white70)),
              const SizedBox(height: 16),
              FilledButton(
                style: FilledButton.styleFrom(backgroundColor: const Color(0xFFFFD23F), foregroundColor: Colors.black),
                onPressed: onSeeAll,
                child: const Text('Lihat produk'),
              ),
            ]),
          ),
        ]),
      ),
      const SizedBox(height: 20),
      Text('Merek populer', style: title),
      const SizedBox(height: 8),
      Wrap(spacing: 8, runSpacing: 8, children: [for (final b in brands) Chip(label: Text(b))]),
      const SizedBox(height: 20),
      Text('Promo hari ini', style: title),
      const SizedBox(height: 8),
      SizedBox(
        height: 310,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: promo.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (_, k) => SizedBox(width: 190, child: ProductCard(p: products[promo[k]], onAdd: () => onAdd(promo[k]))),
        ),
      ),
      const SizedBox(height: 20),
      Text('Kata pembeli', style: title),
      const SizedBox(height: 8),
      for (final t in testimoni)
        Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: CircleAvatar(child: Text(t.$1[0])),
            title: Text(t.$1, style: const TextStyle(fontWeight: FontWeight.w700)),
            subtitle: Text('${'★' * t.$3}  ${t.$2}'),
          ),
        ),
    ]);
  }
}

class ProdukPage extends StatefulWidget {
  final void Function(int) onAdd;
  const ProdukPage({super.key, required this.onAdd});
  @override
  State<ProdukPage> createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  String q = '';
  String brand = 'Semua';
  @override
  Widget build(BuildContext context) {
    final brands = ['Semua', ...{for (final p in products) p.brand}];
    final list = [
      for (var i = 0; i < products.length; i++)
        if ((brand == 'Semua' || products[i].brand == brand) &&
            '${products[i].name} ${products[i].brand} ${products[i].spec}'.toLowerCase().contains(q.toLowerCase()))
          i
    ];
    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: TextField(
          onChanged: (v) => setState(() => q = v),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: 'Cari HP, merek, atau spesifikasi',
            isDense: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
          ),
        ),
      ),
      SizedBox(
        height: 44,
        child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 16), children: [
          for (final b in brands)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ChoiceChip(label: Text(b), selected: brand == b, onSelected: (_) => setState(() => brand = b)),
            ),
        ]),
      ),
      Expanded(
        child: list.isEmpty
            ? const Center(child: Text('Tidak ada HP yang cocok. Coba kata kunci atau merek lain.'))
            : GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 220,
                  mainAxisExtent: 310,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: list.length,
                itemBuilder: (_, k) => ProductCard(p: products[list[k]], onAdd: () => widget.onAdd(list[k])),
              ),
      ),
    ]);
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return ListView(padding: const EdgeInsets.all(24), children: [
      Center(child: ClipOval(child: NetImg('https://i.pravatar.cc/240?img=15', w: 108, h: 108, icon: Icons.person))),
      const SizedBox(height: 16),
      // Ganti teks di bawah dengan data kamu
      Center(child: Text('Javier', style: t.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800))),
      Center(child: Text('Pemilik Ponsel Mart', style: TextStyle(color: t.colorScheme.onSurfaceVariant))),
      const SizedBox(height: 20),
      const Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text('Ponsel Mart menjual HP baru dan bekas dengan harga bersahabat. '
              'Tulis cerita singkat tentang dirimu dan tokomu di sini.'),
        ),
      ),
      const SizedBox(height: 8),
      const ListTile(leading: Icon(Icons.email_outlined), title: Text('25051204431@mhs.unesa.ac.id')),
      const ListTile(leading: Icon(Icons.camera_alt_outlined), title: Text('@javieraniwa_')),
      const ListTile(leading: Icon(Icons.location_on_outlined), title: Text('Magetan')),
    ]);
  }
}

// ---------- GAMBAR ONLINE (ada cadangan kalau gagal dimuat) ----------
class NetImg extends StatelessWidget {
  final String url;
  final double? w, h;
  final IconData icon;
  const NetImg(this.url, {super.key, this.w, this.h, this.icon = Icons.image_outlined});
  @override
  Widget build(BuildContext context) => Image.network(
        url,
        width: w,
        height: h,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(width: w, height: h, color: Colors.blueGrey.withAlpha(60), child: Icon(icon, size: 36)),
        loadingBuilder: (_, child, p) => p == null ? child : Container(width: w, height: h, color: Colors.blueGrey.withAlpha(40)),
      );
}

// ---------- TENTANG KAMI ----------
class TentangPage extends StatelessWidget {
  const TentangPage({super.key});
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final h = t.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800);
    return ListView(padding: const EdgeInsets.all(16), children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: const SizedBox(height: 180, width: double.infinity, child: NetImg('https://picsum.photos/seed/tokohp/900/400')),
      ),
      const SizedBox(height: 16),
      Text('Tentang Ponsel Mart', style: h),
      const SizedBox(height: 8),
      const Text('Kami berdiri sejak 2020 dengan satu tujuan: membuat beli HP jadi mudah, jujur, dan terjangkau. '
          'Setiap unit dicek dulu sebelum dikirim, dan tim kami siap membantu kapan saja.'),
      const SizedBox(height: 16),
      Row(children: [
        for (final s in stats)
          Expanded(
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Column(children: [
                  Text(s.$1, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: t.colorScheme.primary)),
                  Text(s.$2, style: const TextStyle(fontSize: 11)),
                ]),
              ),
            ),
          ),
      ]),
      const SizedBox(height: 16),
      const Card(child: ListTile(leading: Icon(Icons.visibility_outlined), title: Text('Visi'), subtitle: Text('Jadi toko HP online paling dipercaya di Indonesia.'))),
      const Card(child: ListTile(leading: Icon(Icons.flag_outlined), title: Text('Misi'), subtitle: Text('Harga jujur, barang asli, layanan cepat, garansi jelas.'))),
      const SizedBox(height: 16),
      Text('Tim kami', style: h),
      const SizedBox(height: 8),
      Row(children: [
        for (final m in teamData)
          Expanded(
            child: Column(children: [
              ClipOval(child: NetImg('https://i.pravatar.cc/200?img=${m.$3}', w: 76, h: 76, icon: Icons.person)),
              const SizedBox(height: 6),
              Text(m.$1, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
              Text(m.$2, textAlign: TextAlign.center, style: TextStyle(fontSize: 11, color: t.colorScheme.onSurfaceVariant)),
            ]),
          ),
      ]),
    ]);
  }
}

// ---------- KONTAK ----------
class KontakPage extends StatefulWidget {
  final VoidCallback onGoProduk;
  const KontakPage({super.key, required this.onGoProduk});
  @override
  State<KontakPage> createState() => _KontakPageState();
}

class _KontakPageState extends State<KontakPage> {
  final key = GlobalKey<FormState>();
  final nama = TextEditingController(), email = TextEditingController(), pesan = TextEditingController();
  @override
  void dispose() {
    nama.dispose();
    email.dispose();
    pesan.dispose();
    super.dispose();
  }

  String? need(String? v) => (v == null || v.trim().isEmpty) ? 'Wajib diisi' : null;

  @override
  Widget build(BuildContext context) {
    final h = Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800);
    InputDecoration dec(String l, IconData i) =>
        InputDecoration(labelText: l, prefixIcon: Icon(i), border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)));
    return ListView(padding: const EdgeInsets.all(16), children: [
      Text('Hubungi kami', style: h),
      const SizedBox(height: 8),
      const Card(child: ListTile(leading: Icon(Icons.chat_outlined), title: Text('WhatsApp'), subtitle: Text('0819-4962-6876'))),
      const Card(child: ListTile(leading: Icon(Icons.email_outlined), title: Text('Email'), subtitle: Text('halomok@ponselmart.id'))),
      const Card(child: ListTile(leading: Icon(Icons.location_on_outlined), title: Text('Alamat'), subtitle: Text('Jl. Penggadain No. 12, Surabaya'))),
      const Card(child: ListTile(leading: Icon(Icons.schedule_outlined), title: Text('Jam buka'), subtitle: Text('Setiap hari, 09.00 - 21.00 WIB'))),
      const SizedBox(height: 16),
      Text('Kirim pesan', style: h),
      const SizedBox(height: 12),
      Form(
        key: key,
        child: Column(children: [
          TextFormField(controller: nama, decoration: dec('Nama', Icons.person_outline), validator: need),
          const SizedBox(height: 12),
          TextFormField(
            controller: email,
            decoration: dec('Email', Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
            validator: (v) => (v == null || !v.contains('@')) ? 'Masukkan email yang benar' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(controller: pesan, decoration: dec('Pesan', Icons.message_outlined), maxLines: 4, validator: need),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                if (key.currentState!.validate()) {
                  nama.clear();
                  email.clear();
                  pesan.clear();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Pesan terkirim. Kami balas secepatnya.')));
                }
              },
              child: const Text('Kirim pesan'),
            ),
          ),
        ]),
      ),
      const SizedBox(height: 20),
      Text('Pertanyaan umum', style: h),
      for (final f in faqs) ExpansionTile(title: Text(f.$1), childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12), children: [Align(alignment: Alignment.centerLeft, child: Text(f.$2))]),
      const SizedBox(height: 8),
      OutlinedButton(onPressed: widget.onGoProduk, child: const Text('Lihat produk')),
    ]);
  }
}

// ---------- TRANSISI HALAMAN ----------
Route<T> slideRoute<T>(Widget page) => PageRouteBuilder<T>(
      transitionDuration: const Duration(milliseconds: 350),
      reverseTransitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, anim, __, child) {
        final c = CurvedAnimation(parent: anim, curve: Curves.easeOutCubic);
        return FadeTransition(
          opacity: c,
          child: SlideTransition(
            position: Tween<Offset>(begin: const Offset(0.15, 0), end: Offset.zero).animate(c),
            child: child,
          ),
        );
      },
    );

// ---------- MODEL PESANAN ----------
enum OrderStatus {
  menunggu,
  diproses,
  berhasil;

  String get label => switch (this) {
        OrderStatus.menunggu => 'Menunggu pembayaran',
        OrderStatus.diproses => 'Diproses',
        OrderStatus.berhasil => 'Berhasil',
      };
  Color get color => switch (this) {
        OrderStatus.menunggu => const Color(0xFFF59E0B),
        OrderStatus.diproses => const Color(0xFF2563EB),
        OrderStatus.berhasil => const Color(0xFF16A34A),
      };
}

class OrderLine {
  final int idx, qty;
  const OrderLine(this.idx, this.qty);
}

class Review {
  final int rating, qty;
  final String text;
  final Uint8List? photo;
  Review(this.rating, this.text, this.photo, this.qty);
}

class Order {
  final String id, payment, address;
  final String? voucher;
  final List<OrderLine> lines;
  final DateTime date;
  final int subtotal, diskon, ongkir;
  OrderStatus status;
  Review? review;
  Order({
    required this.id,
    required this.lines,
    required this.date,
    required this.payment,
    required this.address,
    this.voucher,
    required this.subtotal,
    required this.diskon,
    required this.ongkir,
    this.status = OrderStatus.menunggu,
  });
  int get total => subtotal - diskon + ongkir;
  int get qty => lines.fold(0, (s, l) => s + l.qty);
}

class OrderStore extends ChangeNotifier {
  final List<Order> orders = [
    // Mock data awal supaya fitur langsung bisa dicoba
    Order(
      id: 'PM100231',
      lines: const [OrderLine(0, 1), OrderLine(7, 2)],
      date: DateTime(2026, 10, 8, 14, 20),
      payment: 'Transfer Bank',
      address: 'Jl. Contoh No. 12, Surabaya',
      subtotal: 5499000 + 2 * 2799000,
      diskon: 0,
      ongkir: 25000,
      status: OrderStatus.berhasil,
    ),
    Order(
      id: 'PM100245',
      lines: const [OrderLine(1, 1)],
      date: DateTime(2026, 10, 10, 9, 5),
      payment: 'E-Wallet',
      address: 'Jl. Contoh No. 12, Surabaya',
      voucher: 'HEMAT10',
      subtotal: 3799000,
      diskon: 379900,
      ongkir: 25000,
      status: OrderStatus.diproses,
    ),
  ];
  void add(Order o) {
    orders.insert(0, o);
    notifyListeners();
  }

  void advance(Order o) {
    if (o.status == OrderStatus.menunggu) {
      o.status = OrderStatus.diproses;
    } else if (o.status == OrderStatus.diproses) {
      o.status = OrderStatus.berhasil;
    }
    notifyListeners();
  }

  void setReview(Order o, Review r) {
    o.review = r;
    notifyListeners();
  }
}

final store = OrderStore();

String fmtDate(DateTime d) {
  String p(int n) => n.toString().padLeft(2, '0');
  return '${p(d.day)}/${p(d.month)}/${d.year} ${p(d.hour)}:${p(d.minute)}';
}

Widget kv(String k, String v, {bool bold = false}) {
  final st = TextStyle(fontWeight: bold ? FontWeight.w800 : FontWeight.w400, fontSize: bold ? 17 : 14);
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(k, style: st),
      const SizedBox(width: 16),
      Flexible(child: Text(v, textAlign: TextAlign.right, style: st)),
    ]),
  );
}

class Stars extends StatelessWidget {
  final int n;
  final double size;
  const Stars(this.n, {super.key, this.size = 18});
  @override
  Widget build(BuildContext context) => Row(mainAxisSize: MainAxisSize.min, children: [
        for (var i = 1; i <= 5; i++) Icon(i <= n ? Icons.star : Icons.star_border, size: size, color: const Color(0xFFFFB300)),
      ]);
}

class StatusChip extends StatelessWidget {
  final OrderStatus s;
  const StatusChip(this.s, {super.key});
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(color: s.color.withAlpha(40), borderRadius: BorderRadius.circular(99)),
        child: Text(s.label, style: TextStyle(color: s.color, fontWeight: FontWeight.w800, fontSize: 12)),
      );
}

class OrderActions extends StatelessWidget {
  final Order o;
  const OrderActions(this.o, {super.key});
  @override
  Widget build(BuildContext context) {
    switch (o.status) {
      case OrderStatus.menunggu:
        return FilledButton(onPressed: () => store.advance(o), child: const Text('Bayar sekarang'));
      case OrderStatus.diproses:
        return OutlinedButton(onPressed: () => store.advance(o), child: const Text('Pesanan diterima'));
      case OrderStatus.berhasil:
        return o.review == null
            ? FilledButton.tonal(onPressed: () => Navigator.of(context).push(slideRoute(ReviewPage(o))), child: const Text('Beri ulasan'))
            : Row(mainAxisSize: MainAxisSize.min, children: [Stars(o.review!.rating), const SizedBox(width: 6), const Text('Ulasan terkirim')]);
    }
  }
}

// ---------- CHECKOUT ----------
class CheckoutPage extends StatefulWidget {
  final Map<int, int> cart;
  final void Function(Order) onPlaced;
  const CheckoutPage({super.key, required this.cart, required this.onPlaced});
  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late final Map<int, int> cart = Map.of(widget.cart);
  final alamat = TextEditingController();
  final voucherC = TextEditingController();
  String bayar = 'Transfer Bank';
  String? voucher, voucherMsg;
  bool showErr = false;
  static const methods = [
    ('Transfer Bank', Icons.account_balance_outlined),
    ('E-Wallet', Icons.account_balance_wallet_outlined),
    ('COD (bayar di tempat)', Icons.local_shipping_outlined),
  ];

  int get subtotal => cart.entries.fold(0, (s, e) => s + products[e.key].price * e.value);
  int get diskon => voucher == 'HEMAT10' ? (subtotal * 0.10).round() : 0;
  int get ongkir => voucher == 'ONGKIRGRATIS' ? 0 : 25000;
  int get total => subtotal - diskon + ongkir;

  @override
  void dispose() {
    alamat.dispose();
    voucherC.dispose();
    super.dispose();
  }

  void chg(int i, int d) => setState(() {
        final n = (cart[i] ?? 0) + d;
        if (n <= 0) {
          cart.remove(i);
        } else {
          cart[i] = n;
        }
      });

  void applyVoucher() {
    final c = voucherC.text.trim().toUpperCase();
    setState(() {
      if (c == 'HEMAT10' || c == 'ONGKIRGRATIS') {
        voucher = c;
        voucherMsg = 'Voucher $c dipakai';
      } else {
        voucher = null;
        voucherMsg = 'Kode voucher tidak valid';
      }
    });
  }

  void place() {
    if (alamat.text.trim().isEmpty) {
      setState(() => showErr = true);
      return;
    }
    final o = Order(
      id: 'PM${DateTime.now().millisecondsSinceEpoch % 1000000}',
      lines: [for (final e in cart.entries) OrderLine(e.key, e.value)],
      date: DateTime.now(),
      payment: bayar,
      address: alamat.text.trim(),
      voucher: voucher,
      subtotal: subtotal,
      diskon: diskon,
      ongkir: ongkir,
    );
    store.add(o);
    Navigator.of(context).pop();
    widget.onPlaced(o);
  }

  @override
  Widget build(BuildContext context) {
    final h = Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800);
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: cart.isEmpty
          ? const Center(child: Text('Keranjang kosong.'))
          : ListView(padding: const EdgeInsets.all(16), children: [
              Text('Daftar produk', style: h),
              for (final e in cart.entries)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(products[e.key].name),
                  subtitle: Text(rp(products[e.key].price)),
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    IconButton(icon: const Icon(Icons.remove_circle_outline), onPressed: () => chg(e.key, -1)),
                    Text('${e.value}', style: const TextStyle(fontWeight: FontWeight.w700)),
                    IconButton(icon: const Icon(Icons.add_circle_outline), onPressed: () => chg(e.key, 1)),
                  ]),
                ),
              const SizedBox(height: 12),
              Text('Alamat pengiriman', style: h),
              const SizedBox(height: 8),
              TextField(
                controller: alamat,
                maxLines: 2,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'Nama jalan, nomor, kota',
                  errorText: showErr && alamat.text.trim().isEmpty ? 'Alamat wajib diisi' : null,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                ),
              ),
              const SizedBox(height: 16),
              Text('Voucher', style: h),
              const SizedBox(height: 8),
              Row(children: [
                Expanded(
                  child: TextField(
                    controller: voucherC,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      hintText: 'Coba HEMAT10 atau ONGKIRGRATIS',
                      isDense: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                FilledButton.tonal(onPressed: applyVoucher, child: const Text('Pakai')),
              ]),
              if (voucherMsg != null)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(voucherMsg!, style: TextStyle(color: voucher != null ? const Color(0xFF16A34A) : Colors.redAccent)),
                ),
              const SizedBox(height: 16),
              Text('Metode pembayaran', style: h),
              for (final m in methods)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(m.$2),
                  title: Text(m.$1),
                  selected: bayar == m.$1,
                  trailing: Icon(bayar == m.$1 ? Icons.check_circle : Icons.circle_outlined),
                  onTap: () => setState(() => bayar = m.$1),
                ),
              const Divider(),
              Text('Ringkasan pesanan', style: h),
              const SizedBox(height: 6),
              kv('Subtotal', rp(subtotal)),
              if (diskon > 0) kv('Diskon (HEMAT10)', '-${rp(diskon)}'),
              kv('Ongkir', ongkir == 0 ? 'Gratis' : rp(ongkir)),
              const Divider(),
              kv('Total pembayaran', rp(total), bold: true),
              const SizedBox(height: 80),
            ]),
      bottomNavigationBar: cart.isEmpty
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: FilledButton(onPressed: place, child: Text('Buat pesanan · ${rp(total)}')),
              ),
            ),
    );
  }
}

// ---------- DAFTAR PESANAN ----------
class PesananPage extends StatefulWidget {
  final VoidCallback onGoProduk;
  const PesananPage({super.key, required this.onGoProduk});
  @override
  State<PesananPage> createState() => _PesananPageState();
}

class _PesananPageState extends State<PesananPage> {
  OrderStatus? filter;
  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: store,
        builder: (context, _) {
          final list = store.orders.where((o) => filter == null || o.status == filter).toList();
          return Column(children: [
            SizedBox(
              height: 56,
              child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(label: const Text('Semua'), selected: filter == null, onSelected: (_) => setState(() => filter = null)),
                ),
                for (final s in OrderStatus.values)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(label: Text(s.label), selected: filter == s, onSelected: (_) => setState(() => filter = s)),
                  ),
              ]),
            ),
            Expanded(
              child: list.isEmpty
                  ? Center(
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        const Text('Belum ada pesanan di sini.'),
                        const SizedBox(height: 12),
                        FilledButton(onPressed: widget.onGoProduk, child: const Text('Belanja sekarang')),
                      ]),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: list.length,
                      itemBuilder: (_, k) => OrderCard(list[k]),
                    ),
            ),
          ]);
        },
      );
}

class OrderCard extends StatelessWidget {
  final Order o;
  const OrderCard(this.o, {super.key});
  @override
  Widget build(BuildContext context) {
    final mute = Theme.of(context).colorScheme.onSurfaceVariant;
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Navigator.of(context).push(slideRoute(OrderDetailPage(o))),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(o.id, style: const TextStyle(fontWeight: FontWeight.w800)),
              StatusChip(o.status),
            ]),
            Text(fmtDate(o.date), style: TextStyle(fontSize: 12, color: mute)),
            const SizedBox(height: 8),
            for (final l in o.lines.take(2)) Text('${products[l.idx].name} × ${l.qty}'),
            if (o.lines.length > 2) Text('+${o.lines.length - 2} produk lainnya', style: TextStyle(color: mute)),
            const SizedBox(height: 8),
            Text('Total ${rp(o.total)}', style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
            const SizedBox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Lihat detail', style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w600)),
              OrderActions(o),
            ]),
          ]),
        ),
      ),
    );
  }
}

// ---------- DETAIL TRANSAKSI ----------
class OrderDetailPage extends StatelessWidget {
  final Order o;
  const OrderDetailPage(this.o, {super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Detail transaksi')),
        body: ListenableBuilder(
          listenable: store,
          builder: (context, _) {
            final h = Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800);
            return ListView(padding: const EdgeInsets.all(16), children: [
              StatusTimeline(o.status),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(children: [
                    kv('No. pesanan', o.id),
                    kv('Tanggal', fmtDate(o.date)),
                    kv('Status', o.status.label),
                    kv('Pembayaran', o.payment),
                    kv('Alamat', o.address),
                  ]),
                ),
              ),
              const SizedBox(height: 12),
              Text('Produk dibeli', style: h),
              for (final l in o.lines)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [products[l.idx].c1, products[l.idx].c2]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.smartphone, color: Colors.white),
                  ),
                  title: Text(products[l.idx].name),
                  subtitle: Text('${l.qty} × ${rp(products[l.idx].price)}'),
                  trailing: Text(rp(products[l.idx].price * l.qty), style: const TextStyle(fontWeight: FontWeight.w700)),
                ),
              const Divider(),
              kv('Subtotal', rp(o.subtotal)),
              if (o.diskon > 0) kv('Diskon (${o.voucher})', '-${rp(o.diskon)}'),
              kv('Ongkir', o.ongkir == 0 ? 'Gratis' : rp(o.ongkir)),
              const Divider(),
              kv('Total pembayaran', rp(o.total), bold: true),
              if (o.review != null) ...[
                const SizedBox(height: 16),
                Text('Ulasan kamu', style: h),
                const SizedBox(height: 8),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Stars(o.review!.rating, size: 22),
                      const SizedBox(height: 6),
                      Text('Jumlah pembelian: ${o.review!.qty} unit', style: const TextStyle(fontSize: 12)),
                      if (o.review!.text.isNotEmpty) ...[const SizedBox(height: 8), Text(o.review!.text)],
                      if (o.review!.photo != null) ...[
                        const SizedBox(height: 10),
                        ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.memory(o.review!.photo!, height: 180, width: double.infinity, fit: BoxFit.cover)),
                      ],
                    ]),
                  ),
                ),
              ],
              const SizedBox(height: 16),
              Align(alignment: Alignment.centerRight, child: OrderActions(o)),
            ]);
          },
        ),
      );
}

class StatusTimeline extends StatelessWidget {
  final OrderStatus status;
  const StatusTimeline(this.status, {super.key});
  @override
  Widget build(BuildContext context) {
    Widget step(OrderStatus s) {
      final done = s.index <= status.index;
      return SizedBox(
        width: 84,
        child: Column(children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: done ? s.color : Colors.blueGrey.withAlpha(60),
            child: Icon(done ? Icons.check : Icons.hourglass_empty, size: 16, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(s.label, textAlign: TextAlign.center, style: TextStyle(fontSize: 11, fontWeight: done ? FontWeight.w800 : FontWeight.w400)),
        ]),
      );
    }

    Widget line(bool done) => Expanded(
          child: Container(height: 3, margin: const EdgeInsets.only(top: 13), color: done ? const Color(0xFF16A34A) : Colors.blueGrey.withAlpha(60)),
        );

    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      step(OrderStatus.menunggu),
      line(status.index >= 1),
      step(OrderStatus.diproses),
      line(status.index >= 2),
      step(OrderStatus.berhasil),
    ]);
  }
}

// ---------- RATING & REVIEW ----------
class ReviewPage extends StatefulWidget {
  final Order o;
  const ReviewPage(this.o, {super.key});
  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int rating = 0;
  final text = TextEditingController();
  Uint8List? foto;

  @override
  void dispose() {
    text.dispose();
    super.dispose();
  }

  Future<void> pick() async {
    final f = await ImagePicker().pickImage(source: ImageSource.gallery, maxWidth: 1200, imageQuality: 80);
    if (f == null) return;
    final b = await f.readAsBytes();
    if (!mounted) return;
    setState(() => foto = b);
  }

  void submit() {
    final messenger = ScaffoldMessenger.of(context);
    if (rating == 0) {
      messenger.showSnackBar(const SnackBar(content: Text('Pilih rating bintang dulu')));
      return;
    }
    store.setReview(widget.o, Review(rating, text.text.trim(), foto, widget.o.qty));
    Navigator.of(context).pop();
    messenger.showSnackBar(const SnackBar(content: Text('Terima kasih atas ulasanmu!')));
  }

  @override
  Widget build(BuildContext context) {
    final h = Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800);
    final labels = ['', 'Buruk', 'Kurang', 'Cukup', 'Bagus', 'Sangat bagus'];
    return Scaffold(
      appBar: AppBar(title: const Text('Beri ulasan')),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        Text('Jumlah pembelian', style: h),
        const SizedBox(height: 4),
        for (final l in widget.o.lines) Text('${products[l.idx].name} × ${l.qty} unit'),
        Text('Total ${widget.o.qty} unit', style: const TextStyle(fontWeight: FontWeight.w700)),
        const SizedBox(height: 20),
        Text('Rating', style: h),
        Row(children: [
          for (var i = 1; i <= 5; i++)
            IconButton(
              onPressed: () => setState(() => rating = i),
              icon: Icon(i <= rating ? Icons.star : Icons.star_border, size: 36, color: const Color(0xFFFFB300)),
            ),
          const SizedBox(width: 8),
          Text(labels[rating]),
        ]),
        const SizedBox(height: 12),
        Text('Review', style: h),
        const SizedBox(height: 8),
        TextField(
          controller: text,
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Ceritakan kondisi barang, pengiriman, dan pelayanan penjual',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
          ),
        ),
        const SizedBox(height: 16),
        Text('Foto bukti', style: h),
        const SizedBox(height: 8),
        if (foto != null)
          Stack(children: [
            ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.memory(foto!, height: 200, width: double.infinity, fit: BoxFit.cover)),
            Positioned(
              top: 6,
              right: 6,
              child: IconButton.filled(onPressed: () => setState(() => foto = null), icon: const Icon(Icons.close), tooltip: 'Hapus foto'),
            ),
          ])
        else
          OutlinedButton.icon(onPressed: pick, icon: const Icon(Icons.add_a_photo_outlined), label: const Text('Tambah foto bukti')),
        const SizedBox(height: 24),
        FilledButton(onPressed: submit, child: const Text('Kirim ulasan')),
      ]),
    );
  }
}