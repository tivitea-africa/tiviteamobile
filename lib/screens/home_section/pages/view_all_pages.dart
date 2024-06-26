import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tivi_tea/core/const/app_assets.dart';
import 'package:tivi_tea/core/const/app_colors.dart';

class ViewAll extends StatelessWidget {
  const ViewAll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          "Photography",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.deepBlue,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.notification,
              color: AppColors.deepBlue,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.element_4,
              color: AppColors.deepBlue,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 253,
              width: 428,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(PlaceholderAssets.image2),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Gap(32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Canon EOS 60D',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 4),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.bolt_outlined,
                              size: 16,
                              color: Colors.green,
                            ),
                            Gap(2),
                            Text(
                              'Available',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(32),
                  _textTitle('Description'),
                  _textDescription(
                    'Canon 60D camera in good working condition. Packed with 2 extra battery',
                  ),
                  const Gap(24),
                  _textTitle(
                    'Accessories',
                  ),
                  _textDescription(
                    '• 2 batteries\n• 1 Charger\n• 1 Outdoor lens\n• 1 Memory Card',
                  ),
                  const Gap(24),
                  _textTitle(
                    'Location',
                  ),
                  _textDescription(
                    'Main island, Lagos, Idumota\nMain island, Lagos, Nigeria.',
                  ),
                  const Gap(24),
                  _textTitle(
                    'About Owner',
                  ),
                  const Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://via.placeholder.com/150'), // Replace with actual image URL
                        radius: 30,
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Femi Adesina',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Photographer',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Gap(16),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 4.0),
                      Text(
                        '3.5',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        '52 reviews',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const Gap(24),
                  _textTitle(
                    'Contact',
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone_outlined,
                        size: 20,
                        color: Colors.grey[60],
                      ),
                      Gap(8),
                      _textDescription(
                        '+234 12 36 31 54 32',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        size: 20,
                        color: Colors.grey[60],
                      ),
                      Gap(8),
                      _textDescription(
                        'contact@tivitea.com',
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

  Widget _textTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _textDescription(String content) {
    return Text(
      content,
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey[60],
      ),
    );
  }
}
