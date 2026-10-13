import 'dart:io';

void main() {
  print('=== National Teachers College - PC16 Mobile Development ===');
  print('Week 8: Dart Programming Fundamentals (Part 2) - Logic Problem Set\n');

  List<String> transactions = ['1500', '500', '0', 'abc', '-200', '3000'];

  print('Starting account transaction verification...\n');

  int validCount = processAccountTransactions(transactions);

  print('\n----------------------------------------');
  print('Summary: Successfully processed $validCount valid transactions.');
  print('Program completed without crashing.');
}

int processAccountTransactions(List<String> rawInputs) {
  int successCount = 0;

  // Loop: Repeats the evaluation task for a fixed number of times
  for (int i = 0; i < rawInputs.length; i++) {
    String currentInput = rawInputs[i];
    print('Checking transaction #${i + 1}: "$currentInput"');

    try {
      int amount = int.parse(currentInput);

      if (amount < 0) {
        print('  -> [Alert]: Negative amount ($amount). Flagged as unauthorized.');
      } else if (amount == 0) {
        print('  -> [Notice]: Zero amount. No transaction occurred.');
      } else if (amount < 1000) {
        print('  -> [Warning]: Low deposit amount ($amount). Below standard threshold.');
        successCount++;
      } else {
        print('  -> [Optimal]: Valid high-value transaction ($amount).');
        successCount++;
      }

    } catch (e) {
      // Error Handling: Catches the crash gracefully and logs the issue
      print('  -> [Error Handled]: "$currentInput" is not a valid number. Skipped safely.');
    }
    print(''); 
  }

  return successCount;
}