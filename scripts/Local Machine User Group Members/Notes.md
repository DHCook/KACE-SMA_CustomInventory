Shows all users that are members of all the local computer's groups. This requires PowerShell 5.1 to work.

Example Output:

Group: Administrators

Class  : User
Group  : Administrators
Source : Local
Name   : ABC-123\Administrator

Class  : User
Group  : Administrators
Source : MicrosoftAccount
Name   : ABC-123\jdoe

Class  : User
Group  : Administrators
Source : MicrosoftAccount
Name   : ABC-123\jsmith


   Group: Guests

Class  : User
Group  : Guests
Source : Local
Name   : ABC-123\Guest


   Group: IIS_IUSRS

Class  : Group
Group  : IIS_IUSRS
Source : Unknown
Name   : NT AUTHORITY\IUSR


   Group: Performance Log Users

Class  : User
Group  : Performance Log Users
Source : MicrosoftAccount
Name   : ABC-123\jsmith


   Group: System Managed Accounts Group

Class  : User
Group  : System Managed Accounts Group
Source : Local
Name   : ABC-123\DefaultAccount


   Group: Users

Class  : User
Group  : Users
Source : MicrosoftAccount
Name   : ABC-123\jdoe

Class  : User
Group  : Users
Source : MicrosoftAccount
Name   : ABC-123\jsmith

Class  : Group
Group  : Users
Source : Unknown
Name   : NT AUTHORITY\Authenticated Users

Class  : Group
Group  : Users
Source : Unknown
Name   : NT AUTHORITY\INTERACTIVE