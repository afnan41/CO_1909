.data 
# msg to enter number to square it
	squaremsg:	.asciiz "Enter number : "
	# msg to show square of number
	squareresultmsg: .asciiz "The square is : "
	# msg to enter size of list
	listsizemsg: .asciiz "Enter size of List :: "
	# msg to enter the list
	listeneteringmsg: "Eneter the list elements :::\n"
	# msg to show min eleminte in list
	minoflistmsg: .asciiz "Min number is : "
	# new line charcter
	newline: .byte '\n'
	# floating Zero
	fzero: .float 0.0
	#print message to enter the Hypotenuse side 
	hypotenuse: .asciiz "Enter Hypotenuse : "
	#print message to enter the Adjacent side
	adjacent: .asciiz "Enter Adjacent : "
	#print message to enter the Opposite side
	opposite: .asciiz "Enter Opposite : "
	#Print message the result of Sin
	sinn: .asciiz "Sin =  "
	#print message the result of Cos
	coss: .asciiz "\nCos = "
	#print message the result of Tan
	tann: .asciiz "\nTan = "
	 #Print message to enter wo Integers
     print_message: .asciiz "Enter Two Integers :: \n"
     #Print the result to the user
     print_Result:  .asciiz "Result is : \n"
     #main messeges
     msg1: .asciiz "Enter code of Operation you need to do\n"
     msg2: .asciiz "1 --> Adding\n2 --> Multiply\n3 --> Division\n4 --> findMinEleinList\n5 --> sin\n6 --> cos\n7 --> tan\n8 --> square\n"
     msg3: .asciiz "9 --> validateTriangle\n10 --> validateRectangle\n:: "
     msg4: .asciiz "\n wrong operation \n" 
     msg5: .asciiz "\n if you need to continue Enter number  0 or any other Number to exit\n"
     msg6: .asciiz "Enter the 3 lengths: \n"
     msg7: .asciiz "Enter 4 lengths" 
.text 
main: 
  loop:
     li $v0 ,4 #load $v0=4 , system call code for printing string =4
     la $a0 , msg1 #load $a0 =address of msg1 
     syscall # call operating system to perform operation specified in $v0 and take its argument from $a0
     li $v0 ,4 #load $v0=4 , system call code for printing string =4
     la $a0 , msg2 #load $a0 =address of msg2
     syscall # call operating system to perform operation specified in $v0 and take its argument from $a0
     li $v0 ,4 #load $v0=4 , system call code for printing string =4
     la $a0 , msg3 #load $a0 =address of msg3
     syscall # call operating system to perform operation specified in $v0 and take its argument from $a0
     #get the operation number
     li $v0, 5 #get integer value
     syscall 
     move $t0 , $v0 #$t0=$v0
     #if else statements 
     bne $t0,1, else1 #branch if !($t0=1)
     jal addition #call addition opperation 
     j endLabel #break from if else loop 
     syscall  
     else1: bne $t0, 2, else2 #branch if !($t0=2)
     jal multiplication #call multiplication operation 
     j endLabel #break from if else loop
     syscall 
     else2: bne $t0, 3, else3 #branch if !($t0=3)
     jal division
     j endLabel #break from if else loop
     syscall 
     else3: bne $t0, 4, else4 #branch if !($t0=4)
     jal  findMinEleinList
     j endLabel #break from if else loop
     syscall 
     else4: bne $t0, 5, else5 #branch if !($t0=5) 
     jal sin 
     j endLabel #break from if else loop
     syscall 
     else5:  bne $t0, 6, else6 #branch if !($t0=6)    
     jal cos 
     j endLabel #break from if else loop
     syscall       
     else6:  bne $t0, 7, else7 #branch if !($t0=7)    
     jal tan
     j endLabel #break from if else loop
     syscall 
     else7:  bne $t0, 8, else8 #branch if !($t0=7)  
     jal sq
     j endLabel #break from if else loop
     syscall  
     else8:  bne $t0, 9, else9 #branch if !($t0=7)  
     jal validateTriangle
     j endLabel #break from if else loop
     syscall 
     else9:  bne $t0, 10, else #branch if !($t0=7)  
     jal validateRectangle
     j endLabel #break from if else loop
     syscall 
     else:  #if user enter wrong number
     li $v0 ,4 #load $v0=4 , system call code for printing string =4
     la $a0 , msg4 #load $a0 =address of msg1   
     j endLabel #break from if else loop
     syscall  
     endLabel: 
     #if user want to complete
     li $v0 ,4 #load $v0=4 , system call code for printing string =4
     la $a0 , msg5 #load $a0 =address of msg1     
     syscall 
     
     li $v0 , 5 #get input from user
     syscall 
     
     move $t1 ,$v0
     beqz $t1 ,loop #check if ($t1=0) go to loop  
     syscall 
     
     li $v0 ,10 #program is done
     syscall

      sq:
		# loading floationg zero
		lwc1 $f1, fzero		#load $f1= fzero
		
		# show number entering msg
		li $v0, 4		#load $v0=4
		la $a0, squaremsg	#load $a0 = Address of squarmsg
		syscall
		
		# get the number
		li $v0, 6		#load $v0=6
		syscall
		
		# calculate square of the number
		mul.s $f0, $f0, $f0     #$f0 * $f0= $f0
		
		# show square result msg
		li $v0, 4		#load $v0 =4
		la $a0, squareresultmsg	#load $a0=Address of squareresultmsg	 
		syscall
		
		# show the square value
		li $v0, 2              #load $v0= 2
		add.s $f12, $f0, $f1   #$f0+ $f1 =$f12
		syscall
		
		# print new line
		li $v0, 4	       #load $v0 =4
		la $a0, newline	       #load $a0=Address of newline
		syscall
		
		# end of square funcation
		jr $ra		       # return address
		
	findMinEleinList:
		# inilize the miniumin
		add $t0, $zero, 1     #$zero + 1= $t0
		sll $t0, $t0, 31      #shift left logical to register $t0 
		not $t0, $t0	      #not to register $t0
		
		# show size entering msg
		li $v0, 4	     #load $v0 =4
		la $a0, listsizemsg  #load $a0 = Adddress of listsizemsg
		syscall
		
		# scan size of list
		li $v0, 5	    #load $v0=5
		syscall
		
		# store size in $t1
		move $t1, $v0      #copy from register $v0 to $t1
		
		# show entering list msg
		li $v0, 4	   #load $v0 =4
		la $a0, listeneteringmsg #load $ao = Address of listeneteringmsg
		syscall
		
		# loop to scan values and detect the minimum
		while:
			# check if all list scaned then exit from loop
			beqz $t1, exit
			
			# subtract 1 from size of list
			add $t1, $t1, -1
			
			# scan element from the list
			li $v0, 5
			syscall
			
			# store the element in $t2
			move $t2, $v0
			
			# check if new prevoius minimum still the minimum value in the list
			slt $s0, $t0, $t2
			
			# if last condition is true then continue loop
			bgtz $s0, while
			
			# else make the minimum is the last element
			move $t0, $t2
			
			# continue loop
			j while
		# label used to go out from the loop
		exit:
		
		# show minimum msg
		li $v0, 4	#load $v0=4
		la $a0, minoflistmsg #load $a0= Address of minoflistmsg
		syscall
		
		# show the minimum
		li $v0, 1      #load $v0=1
		move $a0, $t0  #copy from register $t0  to $a0
		syscall
		
		# print new line
		li $v0, 4	#load $v0 =4
		la $a0, newline	#load $a0 = address of neline
		syscall
		
		# end of find min eleminte in list function
		jr $ra		#retrn address
	sin:
	     #print message to enter the Hypotenuse side  
	     li $v0, 4
	     #hypotenuse=$a0
	     la $a0, hypotenuse
	     syscall	     
	     
             #Get the Hypotenuse side from user
	     li $v0, 5
	     syscall 
	     #Move the value to t1 Reg
	     move $t0, $v0
	     
	    #print message to enter the Opposite side
	     li $v0, 4
	     la $a0, opposite
	     syscall
	       
	     #Get the Opposite side from user 
	     li $v0, 5
	     syscall
	     #Move the value to t1 Reg
	     move $t2, $v0
	     
	     #compute the value of Sin= Oppsite/Hypotenuse
	     #$t0/$t2=$s0
	     div $s0, $t0, $t2
	     
	     #print sentence of "sin="
	     li $v0, 4
	     #sinn=$a0
	     la $a0, sinn
	     syscall
	     
	     #print the value of the sin
	     li $v0,1
	     #$zero+#s0=$a0
	     add $a0, $zero,$s0
	     syscall
	    #return the value 
	    jr	$ra

      cos:
	     #print message to enter the Hypotenuse side   
	     li $v0, 4
	     #hypotenuse=$a0
	     la $a0, hypotenuse
	     syscall	     
	     
             #Get the Hypotenuse side from user
	     li $v0, 5
	     syscall 
	     #Move the value to t1 Reg
	     move $t0, $v0
	       
	    #print message to enter the Adjacent side
	     li $v0, 4
	     la $a0, adjacent
	     syscall
	     
	     #Get the Adjacentside from user
	     li $v0, 5
	     syscall
	     #Move the value to t1 Reg
	     move $t1, $v0
	     
	     #Get Cos value by div Adjacent/Hypotenuse
	     #$t0/$t1=$S
	     div $s1, $t0, $t1
	     
	     #print sentence of "sin="
	     li $v0, 4
	     la $a0, coss
	     syscall
	     
	     #print the value of the cos
	     li $v0,1
	     #$zero+$s1=$a0
	     add $a0, $zero,$s1
	     syscall
	   #return value  
	   jr	$ra
	#function to compute tan
	tan:	
	    
	      
	    #print message to enter the Opposite side 
	     li $v0, 4
	     #opposite =$a0
	     la $a0, opposite
	     syscall
	       
	     #Get the Opposite from user
	     li $v0, 5
	     syscall
	     #Move the value to t1 Reg
	     move $t2, $v0
	     #print message to enter the Adjacent side
	     li $v0, 4
	     la $a0, adjacent
	     syscall
	     
	     #Get the Adjacentside from user
	     li $v0, 5
	     syscall
	     #Move the value to t1 Reg
	     move $t1, $v0
	     
	     #Get Tan value by div Oppsite/Adjacent
	     #$t2/$t1=$s2
	     div $s2, $t2, $t1
	       
	         
	    #print sentence of "Tan="
	     li $v0, 4
	     la $a0, tann
	     syscall
	     
	      #print the value of the tan
	     li $v0,1
	     add $a0, $zero,$s2
	     syscall
	     
	    #return address
	    jr $ra
      	
    #function to addation two numbers
    addition:
    	#print message to enter two numbers
	li $v0, 4		#load $v0=4
	la $a0, print_message   #load $a = Address of Print_message
	syscall
	
	#get the first number
	li $v0,5 		#load $v0 =5
	syscall
	move $t0,$v0		#copy from regiser $v0 to $t0
	
	#get the second number
	li $v0, 5		#load $v0 =5
	syscall
	move $t1 , $v0		#copy from regiser $v0 to $t0
	
	#addtion the two numbers
	add $t2 , $t0,$t1	# $t0 +$t1 = $t2
	
	#print the result to the user
	li $v0,4		#load $v0 = 4
	la $a0 , print_Result	#load $a0  =Addree of Print_result
	li $v0,1		#load $v0 =1
	add $a0,$zero,$t2	#$zero + $t2 =$a0
	syscall
	
   jr $ra			#Return address
   
   #function to multiplication two numbers
   multiplication:
   	#Print message to enter two numbers
	li $v0, 4		#load $v0=4
	la $a0, print_message 	#load $a0 =Address of Print_message
	syscall
	
	#get the first numbers
	li $v0,5		#load $v0 =5 
	syscall
	move $s0,$v0		#copy from regiser $v0 to $s0
	
	#get the second numbers
	li $v0, 5		#load $v0 =5 
	syscall
	move $s1 , $v0 		#copy from regiser $v0 to $s1
	
	#multiplicatiotwo numbers
	mul $t0 , $s0,$s1	#$s1 * $s2 =$t0
	
	#print the result
	li $v0,4		#load $v0=4
	la $a0 , print_Result	#load $a0 =Address of Print_Result
	li $v0,1		#load $v0 =5 
	add $a0,$zero,$t0	#$zero + $t0 =$a0
	syscall
   jr $ra  			#retrun address
   #function to divide two numbers
   division:
        #Print message to enter two numbers
	li $v0, 4		#load $v0=4
	la $a0, print_message 	#load $a0 =Address of Print_message
	syscall
	
	#get the first number
	li $v0,5 		#load $v0 =5 
	syscall
	move $t0,$v0		#copy from regiser $v0 to $t0
	
	#get the second number
	li $v0, 5		#load $v0 =5 
	syscall
	move $t1 , $v0 		#copy from regiser $v0 to $t1
	#divide two numbers
	div $s0 , $t0,$t1	#$t0 /$t1 =$s0
	
	#print the result
	li $v0,4		#load $v0=4	
	la $a0 , print_Result	#load $a0  =Addree of Print_result
	li $v0,1	        #load $v0 =1
	add $a0,$zero,$s0	#$zero + $s0=$a0
	syscall
   jr $ra			#return address
      validateTriangle:
      li $v0 , 4
      la $a0 , msg6
      syscall
      #get first length from user 
      li $v0,5 		#load $v0 =5 
      syscall
      move $t0,$v0	
       #get second length from user 
      li $v0,5 		#load $v0 =5 
      syscall
      move $t1,$v0
       #get third length from user 
      li $v0,5 		#load $v0 =5 
      syscall
      move $t2,$v0
      add $t3,$t0,$t1 #$t0+$t1=$t3
      syscall 
      add $t4,$t1,$t2 #$t2+$t1=$t4
      syscall 
      add $t5,$t0,$t2 #$t0+$t2=$t5
      syscall 
      
      validateRectangle:
      li $v0 , 4
      la $a0 , msg7
      syscall
      #get first length from user 
      li $v0,5 		#load $v0 =5 
      syscall
      move $t0,$v0	
       #get second length from user 
      li $v0,5 		#load $v0 =5 
      syscall
      move $t1,$v0
       #get third length from user 
      li $v0,5 		#load $v0 =5 
      syscall
      move $t2,$v0
      #get third length from user 
      li $v0,5 		#load $v0 =5 
      syscall
      move $t3,$v0