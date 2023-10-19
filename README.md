# To preview proposed changes, use the --dry-run flag
    dart fix --dry-run
# To apply the proposed changes, use the --apply flag
    dart fix --apply

# Scaffold
- sets the bg color of the app to white

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

# StatefulWidget Lifecycle
- Three extremely important stateful widget lifecycle
1- initState(): Executed by Flutter when the StatefulWidget's State object is initialized
2- build(): Executed by Flutter when the Widget is built for the first time AND after setState() was called
3- dispose(): Executed by Flutter right before the Widget will be deleted (e.g., because it was displayed conditionally)

# NOTE:
- We can store components/widgets into variables.
Widget x = const WidgetName();

# heirarchy
- body
    - container
        - child
            - column / row
                - mainAxisSize
                - mainAxisAlignment (vertical alignment)
                - crossAxisAlignment (horizontal alignment)
                - children: []

# Define a MODEL
- class ModelName {
    const ModelName (this.text, this.answers);
  
    final String text;
    final List<String> answers;
}

# ...spreadOperator
- Ex: currentQuestion.answers.map( () {} )
- it is used to convert a list in an object to elements 
- const numbers = [[1, 2, 3], 4];
  const moreNums = [...numbers, 5];
  The result will be:
  [1, 2, 3, 4, 5]

# .map() method for lists
- used to map the items in the list and it doesn't change the order of items in the original list object stored in memory.

# .shuffle() method for lists
- used to change the order of the items in the list. However, it changes the order of items in the original list object stored in memory and that's why we need to copy the original one before shuffling using List.of()

# Data Types
1. List<
    - Map<specifyObjectTypeOrKey, specifyValue> 
    - List<Map<String, Object>> getSummaryData() {
        final List<Map<String, Object>> summary = []; //course 81
        for (var i = 0; i <= chosenAnswers.length; i++) {
        summary.add({
            'question_index': i,
            'question': questions[i].text,
            'correct_answer': questions[i].answers[0],
            'user_answer': chosenAnswers[i],
        });
        }
        return summary;
    }
2. enum
    - to access it's values use categories.name or categories.name[i]
    - enum Categories
        {
            leisure,
            travel,
            food,
            work,
        } 
    - class Expenses
        {
            Expenses.named({required this.category});
            final Categories category;
        }

# Expanded widget
- Creates a widget that expands a child of a [Row], [Column], or [Flex] so that the child fills the available space along the flex widget's main axis.
In other words, child inside Row/Column/Flex won't take space more than their parent widget.
Expanded constraints the child to only take as much space as available in the Row/Column after sizing the other child.

# get  Method
- we can write:
    List<Map<String, Object>> get getSummaryData {
        // function logic goes here
    }
    - calling it without () :
        final summaryData = getSummaryData;

- instead of: 
    List<Map<String, Object>> getSummaryData(){
        // function logic goes here
    }
     - calling it:
        final summaryData = getSummaryData();

# Debug mode
Step over F10 => step into the next line 
Continue F5 => goes to the next breakpoint 

# Column() vs ListView()
 - ListView() is same as Column but it is used for larger data and it has auto scroll.

 # injection syntax using ${} 
- add backslash before special characters to escape them (dollar sign)
    Text('\$${expenseItem.amount.toStringAsFixed(2)}'),

# packages
    - uuid for unique id generation 
    - intl for date/number formatting
    - transparent_image for fadeInImage

# Dispose method
- used in StatefulWidget ONLY
- dispose, like initState and build, is part of a StatefulWidget's life cycle. it is called automatically by flutter when the widget and its state are about to be destroyed (removed from the UI)

# MediaQuery responsiveness & overlappping
- dynamically checking if we are in dark mode
    ex:  final isDarkMode =
            MediaQuery.of(context).platformBrightness == Brightness.dark;
            
- check the width of the screen
    final screenWidth = MediaQuery.of(context).size.width or .height

- prevent overlappping (keyboard)
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    then wrap the widget with SingleChildScrollView
    then wrap with SizedBox and height:double.infinity,
#### useSafeArea (prevent overlapping over the system bar of the phone like: wifi, battery icon, camera...)
- showModalBottomSheet(
      useSafeArea: true,
    )

# LayoutBuilder widget is alternative to MediaQuery responsiveness
- LayoutBuilder(
    builder: (ctx, constraints) => Widget(),
    );
