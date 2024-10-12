import 'package:flutter/material.dart';
import 'package:flutter09/view/screens/payment_screen.dart';

class InvestAccountScreen extends StatelessWidget {
  const InvestAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hi John Doe',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.contact_mail_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => InvestAccountScreen()));
            },
            icon: Icon(Icons.person_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              const Text(
                'Your Account value is',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Divider(),
              ),
              SizedBox(
                height: 20,
              ),
              const Text(
                '\$41,900.1',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _ActionButton(
                    icon: Icons.arrow_forward,
                    label: 'Transfer',
                    onActionButtonClicked: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => PaymentScreen()));
                    },
                  ),
                  _ActionButton(icon: Icons.compare_arrows, label: 'Request'),
                  _ActionButton(icon: Icons.bar_chart, label: 'Statistics'),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Text(
                    "My Portfolios",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))
                ],
              ),
              SizedBox(
                height: 160,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: _PortfolioCard(
                        icon: Icons.school,
                        title: 'Education',
                        subtitle: 'Grade University',
                        value: '\$890.1',
                        change: '0.03 (4.5%)',
                        isPositive: true,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Text(
                    "Recent",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))
                ],
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return _TransactionTile(
                      icon: Icons.bar_chart,
                      title: 'Investment',
                      time: '9:01am',
                      amount: '\$13.10',
                      isPositive: false,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  Function()? onActionButtonClicked;

  _ActionButton({
    Key? key,
    required this.icon,
    this.onActionButtonClicked,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onActionButtonClicked,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[200],
            child: Icon(icon, size: 30),
          ),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}

class _PortfolioCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String value;
  final String change;
  final bool isPositive;

  const _PortfolioCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.change,
    required this.isPositive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200] ?? Colors.white,
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                child: Icon(icon),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(subtitle),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  Text("from \$2,500")
                ],
              ),
              Spacer(),
              Text(
                change,
                style: TextStyle(
                  color: isPositive ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TransactionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String time;
  final String amount;
  final bool isPositive;

  const _TransactionTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.time,
    required this.amount,
    required this.isPositive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(icon),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(time),
      trailing: Text(
        amount,
        style: TextStyle(
            color: isPositive ? Colors.green : Colors.red,
            fontSize: 14,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
