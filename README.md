# 🍼 Lactare Eurofarma

![Flutter](https://img.shields.io/badge/Flutter-3.12+-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.12-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Material Design 3](https://img.shields.io/badge/Material%20Design-3-757575?style=for-the-badge&logo=materialdesign&logoColor=white)
![Platforms](https://img.shields.io/badge/Platforms-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Desktop-6E56CF?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Prot%C3%B3tipo-orange?style=for-the-badge)

Aplicativo Flutter multiplataforma que conecta doadoras de leite materno a um banco de leite, digitalizando todo o fluxo — do cadastro e triagem de elegibilidade até o agendamento da coleta, o acompanhamento em tempo real e a visualização do impacto social gerado.

---

## 📖 Descrição

O **Lactare Eurofarma** é um protótipo de aplicativo voltado para doadoras de leite materno. Ele resolve um problema comum em campanhas de doação de leite: a fricção entre a intenção de doar e a execução do processo (elegibilidade, logística de coleta e retorno de impacto para a doadora).

O app guia a doadora por uma jornada completa:

- Onboarding e cadastro rápido;
- Um quiz de elegibilidade que avalia critérios de saúde antes da doação;
- Agendamento de coleta domiciliar com escolha de data e horário;
- Acompanhamento em tempo real do coletor a caminho (estilo *live tracking*);
- Painel de impacto pessoal (litros doados, bebês impactados, histórico de doações);
- Canal de suporte por chat com a equipe do banco de leite.

Também inclui uma **visão administrativa/executiva** com indicadores agregados (ESG), pensada para gestores acompanharem o programa de doação como um todo.

O projeto foi desenvolvido para a Eurofarma, com foco em usabilidade para gestantes e lactantes e em uma identidade visual acolhedora.

---

## ✅ Funcionalidades

- ✅ Splash screen com identidade visual da marca
- ✅ Cadastro/login rápido de doadora
- ✅ Quiz interativo de elegibilidade para doação
- ✅ Agendamento de coleta (seleção de data e janela de horário)
- ✅ Rastreamento em tempo real do status da coleta (coletor a caminho, ETA)
- ✅ Histórico de doações da usuária
- ✅ Painel "Meu Impacto" (litros doados, bebês impactados, coletas realizadas)
- ✅ Suporte via chat com a equipe do banco de leite
- ✅ Dashboard administrativo com KPIs (doadoras ativas, litros coletados, bebês atendidos, estoque)
- ✅ Navegação por rotas nomeadas
- ✅ UI com Material Design 3 e componentes visuais próprios (cards, temas)

---

## 🛠️ Tecnologias

| Tecnologia | Uso |
|---|---|
| **Flutter** | Framework principal (SDK ^3.12.1) |
| **Dart** | Linguagem da aplicação |
| **Material Design 3** | Sistema de design (`useMaterial3: true`) |
| **cupertino_icons** | Ícones estilo iOS |
| **flutter_lints** | Padrões de qualidade de código (dev) |

> ℹ️ O app atualmente utiliza **dados mockados** (`lib/data/mock_data.dart`) — não há integração com API ou banco de dados externos neste estágio.

---

## 📂 Estrutura do Projeto

```
lib/
├── data/
│   ├── data_model.dart      # Modelos: Donation, CollectionAppointment, QuizQuestion, Donor
│   └── mock_data.dart       # Dados mockados usados nas telas
├── screens/
│   ├── splash_screen.dart
│   ├── login_screen.dart
│   ├── home_screen.dart
│   ├── quiz_screen.dart
│   ├── scheduling_screen.dart
│   ├── tracking_screen.dart
│   ├── impact_screen.dart
│   ├── support_screen.dart
│   └── admindashboard_screen.dart
├── theme/
│   └── app_theme.dart       # Configuração do MaterialApp, tema e rotas
├── widgets/
│   └── widget_app.dart      # Componentes reutilizáveis (ex: ModernCard)
└── main.dart                 # Ponto de entrada da aplicação
```

Além do `lib/`, o repositório inclui os diretórios padrão gerados pelo Flutter para build multiplataforma: `android/`, `ios/`, `web/`, `linux/`, `macos/` e `windows/`.

---

## 🏗️ Arquitetura

O projeto segue uma organização **feature/screen based** simples, comum em protótipos Flutter:

- **`screens/`** — cada tela da aplicação como um widget independente;
- **`widgets/`** — componentes de UI reutilizáveis entre telas;
- **`theme/`** — configuração central do `MaterialApp`, tema visual e tabela de rotas nomeadas;
- **`data/`** — modelos de domínio e fonte de dados mockada, isolando as telas de como os dados são obtidos.

A navegação é feita via **rotas nomeadas** (`Navigator.pushNamed`), definidas centralmente em `LactareApp` (`lib/theme/app_theme.dart`).

---

## 🚀 Como Executar

```bash
# 1. Clonar o repositório
git clone https://github.com/joavlr03/lactare_flutter_app.git
cd lactare_flutter_app

# 2. Instalar as dependências
flutter pub get

# 3. Executar o aplicativo
flutter run
```

Para rodar em uma plataforma específica:

```bash
flutter run -d chrome    # Web
flutter run -d android   # Android
flutter run -d ios       # iOS
```

---

## 📋 Requisitos

- Flutter SDK compatível com Dart `^3.12.1`
- Android Studio ou Xcode (para build mobile) / navegador Chrome (para Web)
- Um dispositivo físico ou emulador/simulador configurado

---

## 📦 Dependências

**Principais**
- `flutter` (SDK)
- `cupertino_icons: ^1.0.8`

**Desenvolvimento**
- `flutter_test` (SDK)
- `flutter_lints: ^6.0.0`

---

## 🔄 Fluxo da Aplicação

```
Splash Screen
      ↓
Login / Cadastro da Doadora
      ↓
Home (visão geral da doadora)
      ↓
Quiz de Elegibilidade  →  Resultado (elegível / não elegível)
      ↓
Agendamento de Coleta
      ↓
Acompanhamento em Tempo Real (status do coletor)
      ↓
Meu Impacto (histórico + indicadores pessoais)

Home → Suporte (chat)
Home → Modo Gestão → Dashboard Administrativo (KPIs)
```

---

## 📱 Principais Telas

| Tela | Rota | Descrição |
|---|---|---|
| **Splash** | `/` | Tela inicial com identidade visual da marca Lactare |
| **Login** | `/login` | Cadastro/login rápido da doadora |
| **Home** | `/home` | Painel inicial da doadora, com acesso às demais funcionalidades |
| **Quiz de Elegibilidade** | `/quiz` | Questionário para validar se a doadora pode doar |
| **Agendamento** | `/scheduling` | Seleção de data e horário para coleta domiciliar |
| **Acompanhamento** | `/tracking` | Status em tempo real da coleta (coletor a caminho, ETA) |
| **Meu Impacto** | `/impact` | Histórico de doações e indicadores de impacto pessoal |
| **Suporte** | `/support` | Chat de suporte com a equipe do banco de leite |
| **Dashboard Admin** | `/admin` | Indicadores executivos/ESG do programa de doação |

---

## 🧩 Organização do Código

- **`screens/`** — Responsável pela composição visual e interação de cada tela.
- **`widgets/`** — Componentes visuais reutilizáveis (ex.: `ModernCard`, um card com sombra e cantos arredondados usado em várias telas).
- **`theme/`** — Configuração global de tema (cores, tipografia, inputs) e definição das rotas do app.
- **`data/`** — Modelos de domínio (`Donation`, `CollectionAppointment`, `QuizQuestion`, `Donor`) e a fonte de dados mockada usada para popular a UI.

---

## 💡 Possíveis Melhorias

- 🔌 Integração com uma API real / backend (atualmente os dados são mockados)
- 🔐 Autenticação real de usuárias
- 🧪 Ampliar a cobertura de testes automatizados (o teste padrão gerado pelo Flutter ainda está presente e desatualizado)
- 🌐 Internacionalização (i18n)
- 📡 Roteirização de coleta com dados reais de geolocalização
- ⚙️ CI/CD para build e deploy automatizados
- 🌓 Suporte a tema escuro
- 📶 Suporte offline-first

---
## Telas 

<img width="926" height="922" alt="Captura de tela 2026-09-03 152413" src="https://github.com/user-attachments/assets/3e637ea8-7a81-40c2-9591-1a7fc696e5da" />

<img width="506" height="1011" alt="Captura de tela 2026-09-03 230302" src="https://github.com/user-attachments/assets/568ea35c-fd66-48f4-b139-bbc7219ab2c1" />

<img width="497" height="1000" alt="Captura de tela 2026-09-03 234856" src="https://github.com/user-attachments/assets/e5abd163-2a18-4637-977f-4ccf21a4a939" />

<img width="497" height="996" alt="Captura de tela 2026-09-03 234913" src="https://github.com/user-attachments/assets/4b020f85-9885-44cb-95aa-229602cadccf" />

<img width="504" height="993" alt="Captura de tela 2026-09-03 234929" src="https://github.com/user-attachments/assets/49c90c44-bdba-41fd-98df-e88d1b6d7b3d" />

<img width="500" height="999" alt="Captura de tela 2026-09-03 234935" src="https://github.com/user-attachments/assets/cbeb0b38-7b85-4d38-b478-08e4e5ef10db" />

<img width="496" height="998" alt="Captura de tela 2026-09-03 234941" src="https://github.com/user-attachments/assets/1ee45fa2-b2e6-492d-a845-948a58500f42" />

<img width="504" height="996" alt="Captura de tela 2026-09-03 234947" src="https://github.com/user-attachments/assets/2164feda-4263-4a78-be5f-b61a4e276c48" />

<img width="499" height="1000" alt="Captura de tela 2026-09-03 234955" src="https://github.com/user-attachments/assets/85915b9f-35e7-4a8e-a3b3-6afcde685a04" />

<img width="501" height="993" alt="Captura de tela 2026-09-03 235004" src="https://github.com/user-attachments/assets/dac97fe7-6be3-45eb-a31a-8051e619149a" />

<img width="496" height="1002" alt="Captura de tela 2026-09-03 235013" src="https://github.com/user-attachments/assets/feab50d1-1881-426e-8790-2d2c16fcc41d" />

<img width="495" height="999" alt="Captura de tela 2026-09-03 235045" src="https://github.com/user-attachments/assets/f247c768-b14d-4e4f-9040-6df097a0ea03" />

<img width="497" height="1006" alt="Captura de tela 2026-09-03 235053" src="https://github.com/user-attachments/assets/03225e55-7f79-4193-8851-2c50e71d079b" />

<img width="493" height="996" alt="Captura de tela 2026-09-03 234849" src="https://github.com/user-attachments/assets/bf79a990-5029-463d-8f23-546ad2b08669" />




