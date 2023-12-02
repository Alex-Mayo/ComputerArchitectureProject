.data

card STRUCT
   name DB 256 DUP(?)  ; Use DUP to allocate an array of 256 bytes
   number DB ?
   suit DB 128 DUP(?) ; Use DUP to allocate an array of 128 bytes
card ENDS

.CODE
asmMain PROC
    ; Your code for asmMain goes here

asmMain ENDP
END
