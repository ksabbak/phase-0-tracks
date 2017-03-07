var colors = ["red", "orange", "yellow", "green"];

var names = ["Ed", "Chester", "Henry", "Dust Commander"];

colors.push("blue");

names.push("He Ain't No Saint");

console.log(colors);

console.log(names);

var horses = {};

for (var i = 0; i < names.length; i++ ) {
 horses[names[i]] = colors[i];
}

console.log(horses);

function Car(color, make, model, year) {
  this.color = color;
  this.make = make;
  this.model = model;
  this.year = year;

  this.stop = function() {console.log("Stops"); };

  this.go = function() {console.log("Goes"); };
  this.paintCar = function(newColor) {this.color = newColor; console.log(this.color); };

}

var myCar = new Car("White", "Saturn", "Ion", "2004");
console.log(myCar);
myCar.go();
myCar.stop();
myCar.paintCar("green");
console.log(myCar);

var dreamCar = new Car("Silver", "Telsa", "Model 3", "2018"); 
console.log(dreamCar);
dreamCar.go();
dreamCar.stop();
dreamCar.paintCar("red");
console.log(dreamCar);

var safariCar = new Car("Camo", "Jeep", "Wrangler", "2017"); 
console.log(safariCar);
safariCar.go();
safariCar.stop();
safariCar.paintCar("covered in mud");
console.log(safariCar);



// for in 
// for of