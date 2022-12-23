.model small
.stack 100h

.data

menu   DB 10,'                     -----------------------------',0dh,0ah
       DB '                ^-^  Welcome To Archive Blood Bank  ^-^',0DH,0AH
       DB '                     -----------------------------',0dh,0ah
       DB 10,'  -------------------------',0DH,0AH
       DB '|<    1. emergencies       >|',0DH,0AH
       DB '|<    2. donors            >|',0DH,0AH
       DB '|<    3. registeration     >|',0DH,0AH
       DB '|<    4. quit              >|',0DH,0AH
       DB '  -------------------------',0DH,0AH
       DB 10,'Enter your choice: $'
       

       
msg           DB 10,10,'- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -'
              DB 10,'<-- THERE are two cases in need of blood donation urgently -->'
              DB 10,'- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -'
              DB 10,10,'FIRST CASE:'
              DB 10,10,'name:Ali'
              DB 10,'governorate_dakahlya'
              DB 10,'blood_type:A+'
              DB 10,'Phone_num:01234567890'
              DB 10,'hospital:mansoura_university' 
              DB 10,10,'*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*'
              DB 10,'SECOND CASE:'
              DB 10,10,'name:OLA'
              DB 10,'governorate_cairo'
              DB 10,'blood_type:B-'
              DB 10,'Phone_num:08087654333'
              DB 10,10,'*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*','$'  
              
msg2          DB 10,10,'- - - - - - - - - - - - - - - -  -'
              DB 10,'<-- THERE are two donors -->'
              DB 10,'- - - - - - - - - - - - - - - - - - -'
              DB 10,10,'FIRST DONOOR:'
              DB 10,10,'name:MONA'
              DB 10,'governorate_GIZA'
              DB 10,'blood_type:O+'
              DB 10,'Phone_num:01234567890' 
              DB 10,10,'*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*'
              DB 10,10,'SECOND DONOR :'
              DB 10,10,'name:OMAR'
              DB 10,'governorate_ASWAN'
              DB 10,'blood_type:AB-'
              DB 10,'Phone_num:08087654333',
              DB 10,10,'*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*','$'
              
info         DB 7 ,0 
phone        DB 11 ,0
govern       DB 9 ,0
b_type       DB 4 ,0
hosp         Dw 20 ,0

msg1 DB     10,10,'- - - - - - - - - - - - - - - -'
     db     10, '      register as : ',0dh,0ah
     DB     '- - - - - - - - - - - - - - - -',0DH,0AH
     db     10,'1. patient',0dh,0ah
     db     '2. donor',0dh,0ah
     DB     '- - - - - - -  ' 
     db     10,'Enter your choice: $'
     
msg3 DB 10,'- - - - - - - - - - - - - - - - ' 
     DB 10,'- - - - - - - - - - - - - - - - ' 
     db 10,'--> Enter your name:','$'
msg4 db 10,'--> Enter your phone number:','$'
msg5 db 10,'--> Enter your governorate:','$'
msg6 db 10,'--> Enter your blood type:','$'
msg7 db 10,'--> Enter your hospital:','$' 

msg8 db 10,10,'Saved your information','$'

msg80 db 10,10,10,'you want to ',0dh,0ah
      db       '1. back',0dh,0ah
      db       '2. quit',0dh,0ah
      db       'Enter your choice : $'

             
      invalid db 10,'Invalid choice. Please try again.$'

.code
    main proc far
     .startup
choice:

  mov ah, 09h
  mov dx, offset menu
  int 21h


  mov ah, 01h
  int 21h



  cmp al, '1'
  je  emergencies
  cmp al, '2'
  je  donors
  cmp al, '3'
  je  registeration
  jmp invalidChoice
  
choice1:

  mov ah, 09h
  mov dx, offset msg80
  int 21h


  mov ah, 01h
  int 21h
  
   cmp al, '1'
   je back
   cmp al,'2'
   je quit
  
   jmp invalidChoice


emergencies:
  mov ah,09h
  mov dx,offset msg
  int 21h
  jmp choice1

donors:
  mov ah,09h
  mov dx,offset msg2
  int 21h
  jmp choice1

registeration:

  mov ah,09h
  mov dx,offset msg1
  int 21h
  
  mov ah,01h
  int 21h
  jmp invalidChoice
 
  mov ah, 09h 
  mov dx, offset msg3  
  int 21h 
    
  mov ah, 0ah 
  mov dx, offset info 
  int 21h
    
  mov ah, 09h 
  mov dx, offset msg4
  int 21h
      
  mov ah, 0ah 
  mov dx, offset phone 
  int 21h
    
  mov ah, 09h 
  mov dx, offset msg5
  int 21h
    
      
  mov ah, 0ah 
  mov dx, offset govern 
  int 21h
    
  mov ah, 09h 
  mov dx, offset msg6
  int 21h
  
  mov ah, 0ah 
  mov dx, offset b_type 
  int 21h
  
   mov ah, 09h 
   mov dx, offset msg7
   int 21h
      
   mov ah, 0ah 
   mov dx, offset hosp 
   int 21h
   
   mov ah,09h
   mov dx,offset msg8
   int 21h
   jmp choice1
   
back:
    mov ah, 4eh
    mov al, 00h
    call choice
    int 21h
    jmp done

  
quit:
  jmp done
  

invalidChoice:
   mov ah, 09h
   mov dx, offset invalid
   int 21h
   jmp choice1

done:
  .exit
  main endp
end main