#include <stdio.h>


void add()
{
  printf("Enter raduis :: ");
  float x, y, result;
  printf("Enter two numbers :: ");
  scanf("%f",&x);
  scanf("%f",&y);
  result = x + y;
  printf("result is : ");
  printf("%f", result);
  printf("\n");
}

void multiply()
{
  printf("Enter raduis :: ");
  float x, y, result;
  printf("Enter two numbers :: ");
  scanf("%f",&x);
  scanf("%f",&y);
  result = x * y;
  printf("result is : ");
  printf("%f", result);
  printf("\n");
}

void division()
{
  printf("Enter raduis :: ");
  float x, y, result;
  printf("Enter two numbers :: ");
  scanf("%f",&x);
  scanf("%f",&y);
  result = x / y;
  printf("result is : ");
  printf("%f", result);
  printf("\n");
}

void findMinEleinList()
{
  int n, x, mn;
  printf("Enter size of List :: ");
  scanf("%d",&n);
  mn = ~((1<<31)^0);
  while(n--)
  {
    scanf("%d", &x);
    if(x < mn)
      mn = x;
  }
  printf("Min number is : ");
  printf("%d", mn);
  printf("\n");
}

void sin()
{
  float x, y, result;
  printf("Enter the opposite : ");
  scanf("%f", &x);
  printf("Enter the Hypotenuse : ");
  scanf("%f", &y);
  result = x / y;
  printf("result is : ");
  printf("%f", result);
  printf("\n");
}

void cos()
{
  printf("Enter the adjacent : ");
  float x, y, result;
  scanf("%f", &x);
  printf("Enter the Hypotenuse : ");
  scanf("%f", &y);
  result = x / y;
  printf("result is : ");
  printf("%f", result);
  printf("\n");
}

void tan()
{
  float x, y, result;
  printf("Enter the opposite : ");
  scanf("%f", &x);
  printf("Enter the adjacent : ");
  scanf("%f", &y);
  result = x / y;
  printf("result is : ");
  printf("%f", result);
  printf("\n");
}

void sq()
{
  float num;
  printf("Enter number : ");
  scanf("%f", &num);
  num = num * num;
  printf("The square is : ");
  printf("%f", num);
  printf("\n");
}

void validateTriangle()
{
  float a, b, c;
  float ab, bc, ac;
  printf("Enter 3 Lengths : ");
  scanf("%f", &a);
  scanf("%f", &b);
  scanf("%f", &c);
  ab = a + b;
  bc = b + c;
  ac = a + c;
  if(ab > c || bc > a || ac > b)
    printf("Vaild\n");
  else
    printf("Not Valid\n");
}

void validateRectangle()
{
  float a, b, c, d;
  printf("Enter 4 Lengths : ");
  scanf("%f", &a);
  scanf("%f", &b);
  scanf("%f", &c);
  scanf("%f", &d);
  if((a==b&&c==d) || (a==c&&b==d) || (a==d&&b==c))
    printf("Vaild\n");
  else
    printf("Not Valid\n");
}

int main(void) {
  int opNum;
  int i ;
  do {
    printf("Enter code of Operation you need to do\n");
    printf("1 --> Adding\n2 --> Multiply\n3 --> Division\n4 --> findMinEleinList\n5 --> sin\n6 --> cos\n7 --> tan\n8 --> square\n");
    printf("9 --> validateTriangle\n10 --> validateRectangle\n:: ");
    scanf("%d", &opNum);
    if(opNum == 1)
      add();
    else if(opNum == 2)
      multiply();
    else if(opNum == 3)
      division();
    else if(opNum == 4)
      findMinEleinList();
    else if(opNum == 5)
      sin();
    else if(opNum == 6)
      cos();
    else if(opNum == 7)
      tan();
    else if(opNum == 8)
      sq();
    else if(opNum == 9)
      validateTriangle();
    else if(opNum == 10)
      validateRectangle();
    else
      printf("Wrong Operation\n");
    printf("if you need to continue Enter 0  or any other number to exit\n");
    scanf("%d",&i);


  } while(i==0);
	getch();
           return ;
}
