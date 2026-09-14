import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers.dart';
import '../../core/theme.dart';
import '../widgets/cinematic_button.dart';
import '../widgets/cinematic_card.dart';
import '../widgets/section_header.dart';
import 'settings_screen.dart';
import 'main_navigation.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scenes = ref.watch(sceneListProvider);

    return Scaffold(
      backgroundColor: DripTheme.voidBlack,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(22, 16, 22, 10),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'DRIPVISION',
                        style: TextStyle(fontSize: 13, letterSpacing: 4.5, fontWeight: FontWeight.w600),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SettingsScreen()),
                      ),
                      icon: const Icon(Icons.person_outline, size: 21, color: DripTheme.chrome),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(22, 18, 22, 28),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'GOOD EVENING, DIRECTOR.',
                      style: TextStyle(fontSize: 11, letterSpacing: 2.8, color: DripTheme.cosmicTeal, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Your worlds are waiting.',
                      style: TextStyle(fontSize: 31, height: 1.03, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 24),
                    CinematicCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SCENES IN LIBRARY',
                            style: TextStyle(fontSize: 9, letterSpacing: 2.5, color: Colors.white.withOpacity(.5)),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '\( {scenes.length} scene \){scenes.length == 1 ? '' : 's'}',
                            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 16),
                          CinematicButton(
                            label: 'CONTINUE PRODUCTION',
                            icon: Icons.play_arrow_rounded,
                            onPressed: () => ref.read(navIndexProvider.notifier).state = 3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              sliver: SliverToBoxAdapter(
                child: SectionHeader(
                  eyebrow: 'QUICK ACTIONS',
                  title: 'Start creating',
                  action: 'VIEW TIMELINE',
                  onAction: () => ref.read(navIndexProvider.notifier).state = 3,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(22, 0, 22, 40),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    Expanded(
                      child: CinematicButton(
                        label: 'NEW FILM',
                        icon: Icons.movie_creation_outlined,
                        onPressed: () => ref.read(navIndexProvider.notifier).state = 1,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CinematicButton(
                        label: 'NEW SCENE',
                        icon: Icons.camera_alt_outlined,
                        primary: false,
                        onPressed: () => ref.read(navIndexProvider.notifier).state = 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
