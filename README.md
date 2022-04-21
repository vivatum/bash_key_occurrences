# String key occurrences counter
Bash script to search unusable localizable strings in project

## Parameters 
1. path to Localizable file
2. min occurrences for key - Integer
3. path to search source folder
  
## Run example 
`% bash key_occurrences_counter.sh /my/localizable/file/Localizable.strings 3 /my/project/folder`

## Report example

`result_list.txt`

REPORT__
Unused Localizable Keys:__
Report start: 2022-04-21 13:56:45__
Search path: /my/project/folder__


"WrongCodeTitle" ---> 2
"WrongCodeMessage" ---> 2
"NetworkError" ---> 2
"ServerCommunicationError" ---> 2
"ServerCouldNotProcessTheContract" ---> 2
"SignatureError" ---> 2
"DeviceRegistrationError" ---> 2
"OldAppVersion" ---> 2
"OperatorIdInvalidError" ---> 2


Report time: 2022-04-21 13:57:06
