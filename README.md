# String key occurrences counter
Bash script to search unusable localizable strings in project

## Parameters 
1. path to Localizable.strings file
2. min occurrences for key - Integer
3. path to search source folder
  
## Run example 
`% bash key_occurrences_counter.sh /my/localizable/file/Localizable.strings 3 /my/project/folder`

## Report example

`result_list.txt`

REPORT <br />
Unused Localizable Keys: <br />
Report start: 2022-04-21 13:56:45 <br />
Search path: /my/project/folder <br />


"WrongCodeTitle" ---> 2 <br />
"WrongCodeMessage" ---> 2 <br />
"NetworkError" ---> 2 <br />
"ServerCommunicationError" ---> 2 <br />
"ServerCouldNotProcessTheContract" ---> 2 <br />
"SignatureError" ---> 2 <br />
"DeviceRegistrationError" ---> 2 <br />
"OldAppVersion" ---> 2 <br />
"OperatorIdInvalidError" ---> 2 <br />

 
Report time: 2022-04-21 13:57:06
