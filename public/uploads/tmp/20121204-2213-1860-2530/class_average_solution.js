var classSize = 0;
var grade = 0;
var counter = 0;
var classAverage = 0;
var total = 0;

function getClassSize () {
	var size = parseInt(window.prompt("Please enter class size:"));
	return size;
}

function getNextGrade () {
	var grd = parseInt(window.prompt("Please enter the grade (0 - 100):"));
	return grd;
}

function isGradeValid ( grade ) {
	var returnValue = true;
	if ( grade < 0 || grade > 100 ) {
		returnValue = false;
	}
	return returnValue;
}

function computeAverage ( totalScore, classSize ) {
	var clsAverage = totalScore / classSize;
	return clsAverage;
}

/* Main block of code */

/* Keep asking for size of class until we get a number greater than zero */
do {
	classSize = getClassSize();
} while ( classSize <= 0 );						

/* Set up loop to count for number of students. We start from zero so stop one before the number */
while ( counter < classSize ) {
	grade = getNextGrade();
	
	/* If we get an invalid grade we use continue to jump back to the top of the loop
	   Importantly, this means that we DON'T add the invalid grade to the total and 
	   we DON'T add one to our counter variable */
	if ( !isGradeValid( grade ) ) {		/* If we get a false from isGradeValid the '!' makes it true */
		continue;
	}
	total += grade;
	counter++;
}

classAverage = computeAverage(total, classSize);

document.writeln("The class average is: " + classAverage);