import 'package:flutter/material.dart';
import 'package:lactare_flutter_app/data/mock_data.dart';
import 'package:lactare_flutter_app/widgets/widget_app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final donor = MockData.currentDonor;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFFFF3B6B).withOpacity(0.1),
              child: const Text('👩', style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Olá, ${donor.name}!', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                const Text('Doadora Ativa', style: TextStyle(fontSize: 12, color: Color(0xFFFF3B6B), fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.admin_panel_settings_outlined, color: Color(0xFF64748B)),
            tooltip: 'Modo Gestão',
            onPressed: () => Navigator.pushNamed(context, '/admin'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Principal de Impacto (Gradient Hero Card)
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF0F172A).withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF3B6B).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.favorite, size: 14, color: Color(0xFFFF3B6B)),
                            SizedBox(width: 6),
                            Text('Seu Impacto', style: TextStyle(color: Color(0xFFFF3B6B), fontSize: 12, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Você já ajudou a alimentar ${donor.babiesImpacted} bebês!',
                    style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900, height: 1.2),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildHeaderStat('Litros Doados', '${donor.totalLiters} L'),
                      Container(height: 30, width: 1, color: Colors.white24),
                      _buildHeaderStat('Coletas Feitas', '${donor.totalCollections}'),
                      Container(height: 30, width: 1, color: Colors.white24),
                      _buildHeaderStat('Próxima Coleta', '10/09'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),
            const Text(
              'Ações Rápidas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Color(0xFF0F172A)),
            ),
            const SizedBox(height: 16),

            // Grid de Ações
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.1,
              children: [
                _buildActionCard(
                  context,
                  title: 'Triagem de Elegibilidade',
                  subtitle: 'Quiz rápido',
                  icon: Icons.assignment_turned_in_rounded,
                  color: const Color(0xFF8B5CF6),
                  route: '/quiz',
                ),
                _buildActionCard(
                  context,
                  title: 'Agendar Coleta',
                  subtitle: 'Em sua casa',
                  icon: Icons.calendar_month_rounded,
                  color: const Color(0xFFFF3B6B),
                  route: '/scheduling',
                ),
                _buildActionCard(
                  context,
                  title: 'Status da Coleta',
                  subtitle: 'Acompanhar rota',
                  icon: Icons.local_shipping_rounded,
                  color: const Color(0xFF2563EB),
                  route: '/tracking',
                ),
                _buildActionCard(
                  context,
                  title: 'Suporte 24h',
                  subtitle: 'Especialistas',
                  icon: Icons.support_agent_rounded,
                  color: const Color(0xFF16A34A),
                  route: '/support',
                ),
              ],
            ),

            const SizedBox(height: 16),
            ModernCard(
              onTap: () => Navigator.pushNamed(context, '/impact'),
              child: const Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFFFEF3C7),
                    child: Icon(Icons.bar_chart_rounded, color: Color(0xFFD97706)),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Histórico e Métricas', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Text('Veja todos os seus registros de doação', style: TextStyle(color: Colors.grey, fontSize: 13)),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderStat(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.white60, fontSize: 12)),
      ],
    );
  }

  Widget _buildActionCard(BuildContext context, {required String title, required String subtitle, required IconData icon, required Color color, required String route}) {
    return ModernCard(
      onTap: () => Navigator.pushNamed(context, route),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color, size: 26),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14, color: Color(0xFF0F172A))),
              const SizedBox(height: 2),
              Text(subtitle, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
