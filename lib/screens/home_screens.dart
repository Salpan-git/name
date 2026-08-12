import 'package:flutter/material.dart';
 
// ===================================================================
// หน้าแรกของเว็บ "ขายภาพถ่าย/ภาพประกอบ" (Image Marketplace)
// ปรับมาจากเทมเพลตจองบริการเดิม โดยเปลี่ยน:
//  - ServiceItem  -> ImageProduct  (เพิ่มฟิลด์ price และ photographer)
//  - หัวข้อ/ข้อความต่าง ๆ ให้เป็นภาษาที่เข้ากับร้านขายภาพ
//  - ปุ่ม "Book Service" -> "ซื้อภาพนี้" พร้อมแสดงราคา
//  - การ์ดภาพ เพิ่ม "ป้ายราคา" มุมขวาบน แทนดาวรีวิว (ใช้ยอดดาวน์โหลดแทน)
// ===================================================================
 
class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});
 
  @override
  State<HomeScreens> createState() => _HomeScreensState();
}
 
class _HomeScreensState extends State<HomeScreens> {
  final TextEditingController searchController = TextEditingController();
 
  // 1) เปลี่ยนชื่อลิสต์ + ข้อมูลให้เป็นภาพขายพร้อมราคา (price)
  final List<ImageProduct> popularImages = const [
    ImageProduct(
      title: 'ภาพวาดหญิงสาวยามเย็น',
      photographer: 'by Aoi Studio',
      imageUrl:
          'https://images.unsplash.com/photo-1524504388940-b1c1722653e1'
          '?auto=format&fit=crop&w=900&q=80',
      price: '฿150',
      downloads: '3.9k',
    ),
    ImageProduct(
      title: 'ภูเขากับทะเลหมอก',
      photographer: 'by Nattapon',
      imageUrl:
          'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee'
          '?auto=format&fit=crop&w=900&q=80',
      price: '฿99',
      downloads: '2.1k',
    ),
    ImageProduct(
      title: 'ตกแต่งภายในมินิมอล',
      photographer: 'by Studio Kraam',
      imageUrl:
          'https://images.unsplash.com/photo-1494526585095-c41746248156'
          '?auto=format&fit=crop&w=900&q=80',
      price: '฿199',
      downloads: '1.8k',
    ),
  ];
 
  final List<ImageProduct> newArrivalImages = const [
    ImageProduct(
      title: 'สตูดิโอถ่ายภาพ',
      photographer: 'by Pim',
      imageUrl:
          'https://images.unsplash.com/photo-1524758631624-e2822e304c36'
          '?auto=format&fit=crop&w=700&q=80',
      price: '฿120',
      downloads: '4.9k',
    ),
    ImageProduct(
      title: 'มินิมอลสีเขียว',
      photographer: 'by Kan',
      imageUrl:
          'https://images.unsplash.com/photo-1460317442991-0ec209397118'
          '?auto=format&fit=crop&w=700&q=80',
      price: '฿89',
      downloads: '3.5k',
    ),
    ImageProduct(
      title: 'มุมนั่งเล่นสุดคูล',
      photographer: 'by June',
      imageUrl:
          'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85'
          '?auto=format&fit=crop&w=700&q=80',
      price: '฿250',
      downloads: '1.2k',
    ),
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFFF1F4F3),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 120),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // 2) เพิ่มหัวเว็บง่าย ๆ: ชื่อร้าน + ไอคอนตะกร้าสินค้า
                  //    (แทนที่ตำแหน่งที่อยู่ ซึ่งไม่จำเป็นสำหรับร้านขายภาพ)
                  _buildStoreHeader(),
                  const SizedBox(height: 18),
 
                  _buildSearchBox(),
                  const SizedBox(height: 24),
 
                  // 3) เปลี่ยนชื่อหมวดหมู่ให้เข้ากับร้านขายภาพ
                  const SectionTitle(title: 'ภาพยอดนิยม'),
                  const SizedBox(height: 12),
 
                  SizedBox(
                    height: 240,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: popularImages.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 14),
                      itemBuilder: (context, index) {
                        return LargeImageCard(
                          item: popularImages[index],
                          onTap: () => _openImage(popularImages[index]),
                        );
                      },
                    ),
                  ),
 
                  const SizedBox(height: 22),
                  const SectionTitle(title: 'ภาพมาใหม่'),
                  const SizedBox(height: 12),
 
                  SizedBox(
                    height: 190,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: newArrivalImages.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        return SmallImageCard(
                          item: newArrivalImages[index],
                          onTap: () => _openImage(newArrivalImages[index]),
                        );
                      },
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
 
  // ส่วนหัวร้าน: โลโก้ชื่อร้าน + ปุ่มตะกร้าสินค้า
  Widget _buildStoreHeader() {
    return Row(
      children: [
        const Text(
          'PixelMarket',
          style: TextStyle(
            color: Color(0xFF1D2221),
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart_outlined),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF1D2221),
          ),
        ),
      ],
    );
  }
 
  Widget _buildSearchBox() {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.025),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        controller: searchController,
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          if (value.trim().isEmpty) return;
 
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('กำลังค้นหาภาพ "$value"'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        decoration: InputDecoration(
          // 4) เปลี่ยนข้อความค้นหาให้เข้ากับร้านขายภาพ
          hintText: 'ค้นหาภาพที่ต้องการ...',
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 14,
          ),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: Colors.grey.shade500,
            size: 22,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              searchController.clear();
            },
            icon: const Icon(Icons.tune_rounded),
            color: const Color(0xFF087A63),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
 
  void _openImage(ImageProduct item) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return ImageDetailSheet(item: item);
      },
    );
  }
}
 
class SectionTitle extends StatelessWidget {
  final String title;
 
  const SectionTitle({super.key, required this.title});
 
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF1D2221),
            fontSize: 19,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.3,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Text(
            'ดูทั้งหมด', // 5) "See all" -> "ดูทั้งหมด"
            style: TextStyle(
              color: Color(0xFF087A63),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
 
// 6) การ์ดภาพขนาดใหญ่: เพิ่ม "ป้ายราคา" ลอยมุมขวาบนของรูป
class LargeImageCard extends StatelessWidget {
  final ImageProduct item;
  final VoidCallback onTap;
 
  const LargeImageCard({super.key, required this.item, required this.onTap});
 
  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.sizeOf(context).width * 0.72;
 
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cardWidth.clamp(240.0, 290.0),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.035),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Hero(
                      tag: 'image-large-${item.title}',
                      child: RemoteImage(
                        imageUrl: item.imageUrl,
                        borderRadius: 20,
                      ),
                    ),
                  ),
                  // ป้ายราคา
                  Positioned(
                    top: 8,
                    right: 8,
                    child: PriceTag(price: item.price),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF202524),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.photographer,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      // 7) ใช้ไอคอนดาวน์โหลดแทนดาวรีวิว (เข้ากับร้านขายภาพมากกว่า)
                      Icon(Icons.download_rounded,
                          size: 14, color: Colors.grey.shade500),
                      const SizedBox(width: 2),
                      Text(
                        item.downloads,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 
class SmallImageCard extends StatelessWidget {
  final ImageProduct item;
  final VoidCallback onTap;
 
  const SmallImageCard({super.key, required this.item, required this.onTap});
 
  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.sizeOf(context).width * 0.42;
 
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: cardWidth.clamp(145.0, 175.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: RemoteImage(
                      imageUrl: item.imageUrl,
                      borderRadius: 20,
                    ),
                  ),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: PriceTag(price: item.price, small: true),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              item.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF252A29),
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              item.photographer,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 
// 8) วิดเจ็ตใหม่: ป้ายราคาทรงแคปซูลลอยบนรูปภาพ
class PriceTag extends StatelessWidget {
  final String price;
  final bool small;
 
  const PriceTag({super.key, required this.price, this.small = false});
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: small ? 8 : 10,
        vertical: small ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF087A63),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        price,
        style: TextStyle(
          color: Colors.white,
          fontSize: small ? 11 : 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
 
class RemoteImage extends StatelessWidget {
  final String imageUrl;
  final double borderRadius;
 
  const RemoteImage({
    super.key,
    required this.imageUrl,
    required this.borderRadius,
  });
 
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: double.infinity,
        color: const Color(0xFFE2E7E5),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Color(0xFF087A63),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Icon(
                Icons.image_not_supported_outlined,
                size: 42,
                color: Color(0xFF7A8581),
              ),
            );
          },
        ),
      ),
    );
  }
}
 
// 9) เปลี่ยน ServiceDetailSheet -> ImageDetailSheet
//    แสดงราคา + ปุ่ม "ซื้อภาพนี้" แทน "Book Service"
class ImageDetailSheet extends StatelessWidget {
  final ImageProduct item;
 
  const ImageDetailSheet({super.key, required this.item});
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 44,
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xFFD5DAD8),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              height: 210,
              child: RemoteImage(imageUrl: item.imageUrl, borderRadius: 24),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.photographer,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  item.price,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF087A63),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.download_rounded,
                    size: 16, color: Colors.grey.shade500),
                const SizedBox(width: 4),
                Text(
                  '${item.downloads} ดาวน์โหลด',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'ภาพความละเอียดสูง พร้อมไฟล์ใช้งานเชิงพาณิชย์ ดาวน์โหลดได้ทันที '
              'หลังชำระเงินเรียบร้อย',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF087A63),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: Text(
                  'ซื้อภาพนี้ • ${item.price}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 
// 10) เปลี่ยน ServiceItem -> ImageProduct
//     เพิ่มฟิลด์ price (ราคา) และ photographer (ผู้ถ่าย/เจ้าของภาพ)
//     เปลี่ยน rating -> downloads (ยอดดาวน์โหลด เข้ากับร้านขายภาพมากกว่าดาวรีวิว)
class ImageProduct {
  final String title;
  final String photographer;
  final String imageUrl;
  final String price;
  final String downloads;
 
  const ImageProduct({
    required this.title,
    required this.photographer,
    required this.imageUrl,
    required this.price,
    required this.downloads,
  });
}