import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget reviewsTab(){
  return  ListView.builder (
    itemBuilder: (BuildContext context, int index) {
      return  Card(color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'assets/images/Ellipse 189(2).png'),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Murad Mohamed',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Product manager',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: List.generate(
                      5,
                          (index) => const Icon(Icons.star,
                          color: Colors.amber, size: 18),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Tenetur minima et nostrum dolorem amet minima ab omnis. '
                    'Inventore maxime et. Laborum deleniti ratione et. '
                    'Odit sapiente facilis occaecati distinctio quam amet. '
                    'Minima id hic in dicta eos quas. Blanditiis nesciunt eos.',
                style: TextStyle(
                    fontSize: 14, color: Colors.black87),
              ),
            ],
          ),
        ),
      );
    },
    
    itemCount: 5,

  );
}