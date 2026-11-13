#include <stdio.h>

int main() {

	char fname[16];
	char lname[16];


	printf("What is your name?");

	scanf_s("%s %s", fname, sizeof(fname), lname, sizeof(lname));

	printf("Your name is %s %s", fname, lname);


}