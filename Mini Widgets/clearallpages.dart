ElevatedButton(
            child: Text('Clear All Pages and Go {page3()}'),
            onPressed: () => Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => page3(),
                ),
                (route) => false)),
