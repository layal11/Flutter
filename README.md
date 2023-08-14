# To preview proposed changes, use the --dry-run flag
    dart fix --dry-run
# To apply the proposed changes, use the --apply flag
    dart fix --apply

# Container
Container (
    docoration: .....
    child: Center (...),
           Column (...),
           Row (...),
)

# constructor function 
- same as class name
- has no return type
- const WidgetName(this.x, this.y, {super.key});

# StatefulWidget 
- has 2 classes and a state.
- The second class starts with _ which means it is private and can only be used internally in the file.
- In this private class we declare our variables and define functions.
- NOTE: setting state will cause this build to execute, thus causing the image to change