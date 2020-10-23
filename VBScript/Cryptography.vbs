Function String2Asc( strIn)
  arrResult = Array()
  ReDim arrResult( CInt( Len( strIn ) ) )
  For intI = 0 to Len(strIn) - 1
      arrResult( intI ) = Asc( Mid( strIn,intI + 1 ,1 ) )
  Next
  String2Asc = arrResult
End Function
'******************************************************************************
'** Function:     Encrypt
'** Purpose / Comments:Encrypt a string in to an encrypted string
'** Arguments : 
'**   strEncrypt   :   string to be encrypted
'**   strKey       :   string used as encryption key
'**   intSeed      :   integer to make the encryption random
'**
'** Returns   : an encrypted string
 
'******************************************************************************
Function Encrypt( strEncrypt, strKey, intSeed)
  Rnd(-1)
  Randomize intSeed
  intRnd =  Int( ( Len(strKey) - 1 + 1 ) * Rnd + 1 )
  
  arrEncrypt = String2Asc(strEncrypt)
  arrKey = String2Asc(strKey)
  
  For intI = 0 to UBound( arrEncrypt ) - 1
      
      intPointer = intI + intRnd
      If intPointer > UBound(arrKey) Then
         intPointer = intPointer -  ((UBound(arrKey) + 1 ) * Int(intPointer / (UBound(arrKey) + 1)))
      End If
      
      intCalc = arrEncrypt(intI) + arrKey(intPointer)
      
      If intCalc > 256 Then
      	intCalc = intCalc - 256 
      End If
      strEncrypted = strEncrypted & Chr(intCalc)
  Next
  encrypt = strEncrypted
End Function
'******************************************************************************
'** Function:     Decrypt
'** Purpose / Comments: Decrypt an encrypted string
* Arguments : strDecrypt   :   string to be Decrypted
'**   strKey       :   string used as encryption key
'**   intSeed      :   integer used to make the encryption random
'** Returns   :'**   A Decrypted string
    
'******************************************************************************
Function Decrypt( strDecrypt, strKey, intSeed)
  Rnd(-1)
  Randomize intSeed
  intRnd =  Int( ( Len(strKey) - 1 + 1 ) * Rnd + 1 )
  
  arrDecrypt = String2Asc(strDecrypt)
  arrKey = String2Asc(strKey)
    
  For intI = 0 to UBound( arrDecrypt ) - 1
      
      intPointer = intI + intRnd
      If intPointer > UBound(arrKey) Then
         intPointer = intPointer -  ((UBound(arrKey) + 1 ) * Int(intPointer / (UBound(arrKey) + 1)))
      End If
      
      intCalc = arrDecrypt(intI) - arrKey(intPointer)
      
      If intCalc < 0 Then
      	intCalc = intCalc + 256 
      End If
      strDecrypted = strDecrypted & Chr(intCalc)
  Next
  Decrypt = strDecrypted
End Function
