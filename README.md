# Employees http get request

## Description
This is a Simple flutter app which fetches employees data from an api using http get method then displays employees data in a Tile per employee
along with a detailed info about the employees in a seperated page which you can navigate when clicking on the tile, 

## Features

- Displays a list of employees with their Info.
- Seperate page for for detailed per employee tile
- Show/Hide button for hiding the employees list(Note: this button will be used to cache data in another Project)  
- Circular loading indicator while running the fetch process

## code explanation
 the code flow is done as the following:-  
  1- fetches data from the api as a string using http get request  
  2- converts the data from string to json Map   
  3- converts json map to our defined employee class model  
  4- storing each class model after creating its instance in employees list then returning that list  
  5- steps 1~4 are all in a function which is called in the home page inside another function  which stores the returned list in a list variable local to the home page
     and that function is called inside an initState Function in order to run once the Ui build method is done building the Ui.  
  6- data is now ready for displaying in listView builder of ListTile per Employee.  


## Application Screenshots: 
|![swappy-20250116-010831](https://github.com/user-attachments/assets/4aa4d31f-7e6c-4e98-8d92-d06b979d9652)|![swappy-20250116-010901](https://github.com/user-attachments/assets/7cc6ecd8-18ae-475b-b823-b4656dd2d8b8)|![swappy-20250116-010929](https://github.com/user-attachments/assets/54b306e9-e57b-4147-9cdf-fd9d9d0475ca)|![swappy-20250116-013052](https://github.com/user-attachments/assets/fbe9f2f1-6ea9-4e88-8d91-18de5666d3b8)|
|-|-|-|-|
