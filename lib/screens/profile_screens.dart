// ...existing code...
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class ProfileScreens extends StatelessWidget {
  const ProfileScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/BG.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 20),

                // Profile avatar + edit button
                Center(
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 53,
                        foregroundColor: AppColors.border,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            'assets/images/pro.jpg',
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 10,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                            color: AppColors.accent,
                          ),
                          child: const Icon(Icons.edit, color: Colors.black, size: 12),
                        ),
                      ),
                    ],
                  ),
                ),

                // Full Name & Email
                
                const SizedBox(height: 20),
                Center(
                   child: Text(
                     'SALPAN JULY',
                     style: AppTextStyles.heading2.copyWith(color: Colors.white),
                   ),
                 ),
                 const SizedBox(height: 10),
                Center(child: Text('salpan.july@example.com', 
                style: AppTextStyles.heading3.copyWith(color: Colors.white),)  ),

                // Account Settings
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Account Settings', 
                  style: AppTextStyles.heading2.copyWith(color: Colors.white),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: AppColors.surface,
                      border: const Border(
                        bottom: BorderSide(color: AppColors.border, width: 1),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          hoverColor: AppColors.accent.withOpacity(0.1),
                          leading: const Icon(Icons.lock, color: Color.fromARGB(255, 21, 192, 21)),
                          title: Text('Change Password', style: AppTextStyles.bodyMedium),
                          subtitle: Text('Update your account password', style: AppTextStyles.bodySmall),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {},
                        ),
                        Divider(color: const Color.fromARGB(255, 252, 252, 252).withOpacity(0.5), thickness: 1),
                        ListTile(
                          hoverColor: AppColors.accent.withOpacity(0.1),
                          leading: const Icon(Icons.notifications, color: Color.fromARGB(255, 49, 192, 21)),
                          title: Text('Notification Settings', style: AppTextStyles.bodyMedium),
                          subtitle: Text('Manage your notification preferences', style: AppTextStyles.bodySmall),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {},
                        ),
                        Divider(color: AppColors.divider.withOpacity(0.5), thickness: 1),
                        ListTile(
                          hoverColor: AppColors.accent.withOpacity(0.1),
                          leading: const Icon(Icons.privacy_tip, color: Color.fromARGB(255, 21, 192, 72)),
                          title: Text('Privacy Settings', style: AppTextStyles.bodyMedium),
                          subtitle: Text('Manage your privacy preferences', style: AppTextStyles.bodySmall),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),

                // Preferences
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Preferences', 
                  style: AppTextStyles.heading2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: const Color.fromARGB(255, 231, 231, 231),
                      border: const Border(
                        bottom: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 1),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          hoverColor: AppColors.accent.withOpacity(0.1),
                          leading: const Icon(Icons.info, color: Color.fromARGB(255, 0, 0, 0)),
                          title: Text('About Us', style: AppTextStyles.bodyMedium),
                          subtitle: Text('Learn more about our company', style: AppTextStyles.bodySmall),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {},
                        ),
                        Divider(color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5), thickness: 1),
                        ListTile(
                          hoverColor: AppColors.accent.withOpacity(0.1),
                          leading: const Icon(Icons.brush, color: Color.fromARGB(255, 0, 0, 0)),
                          title: Text('Theme Settings', style: AppTextStyles.bodyMedium),
                          subtitle: Text('Manage your theme preferences', style: AppTextStyles.bodySmall),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {},
                        ),
                        Divider(color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5), thickness: 1),
                        ItemMenuSetting(
                          icon: Icons.calendar_today,
                          title: 'Appointment Settings',
                          subtitle: 'Manage your appointment preferences',
                          trailingIcon: Icons.arrow_forward_ios,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ItemMenuSetting extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final IconData trailingIcon;
  final VoidCallback onTap;

  const ItemMenuSetting({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailingIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      hoverColor: AppColors.border.withOpacity(0.15),
      leading: Icon(icon, color: const Color.fromARGB(255, 112, 192, 21)),
      title: Text(title, style: AppTextStyles.bodyMedium),
      subtitle: Text(subtitle, style: AppTextStyles.bodySmall),
      trailing: Icon(trailingIcon, size: 16),
      onTap: onTap,
    );
  }
}
// ...existing code...