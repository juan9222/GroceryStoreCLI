## Grocery Store CLI
This is a command-line application that calculates the total price, individual item totals, and the total savings for a list of items purchased at a local grocery store. It follows the principles of Clean Architecture.

### Features
1. Calculate total cost of items purchased.
2. Apply sale prices where applicable.
3. Display a receipt with item quantities, individual item totals, and total savings.


### Setup
1. Check if you have Ruby installed on your system. You can download it from ruby-lang.org.

```bash
ruby -v
```

2. Clone this repository or download the files.

```bash
git clone https://github.com/juan9222/GroceryStoreCLI.git
```

3. Navigate to the project directory.

```bash
cd GroceryStoreAPI
```

### Running the Application

1. Run the application using the following command:

```bash
ruby grocery_store_cli.rb
```

When prompted, enter all the items purchased separated by a comma. For example:

```bash
milk,milk,bread,banana,bread,bread,bread,milk,apple
```

The application will display a receipt with the item quantities, individual item totals, and total savings.

Please enter all the items purchased separated by a comma

```bash
milk,milk,bread,banana,bread,bread,bread,milk,apple
```


```bash
Item     Quantity      Price
--------------------------------------
Milk      3            $8.97
Bread     4            $8.17
Apple     1            $0.89
Banana    1            $0.99
--------------------------------------
Total price : $19.02
You saved $3.45 today.
```

### Code Structure

app/entities/item.rb: Defines the Item entity.

app/use_cases/calculate_receipt.rb: Contains the CalculateReceipt use case which calculates the receipt details.

grocery_store_cli.rb: Main executable file that handles user input and displays the receipt.
