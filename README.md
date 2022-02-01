# KACE Systems Management Appliance Custom Inventory Rules
This is a collection of various scripts I have written and used in the KACE SMA to inventory information about Window's based systems.

## Creating a Custom Inventory Rule
To not repeat what has already been written, I'm going to link to a few good resources for writing and adding Custom Inventory Rules to the KACE SMA.
It's always good to start with the source, the documentation of the appliance. This is the documentation for version 12.0 (the latest release at time of writing):
https://support.quest.com/technical-documents/kace-systems-management-appliance/12.0%20common%20documents/administrator-guide/143#ID0ESECY

If you have a support account through Quest, you can access this KB article for an example:
https://support.quest.com/kace-systems-management-appliance/kb/223293/how-to-create-a-custom-inventory-rule

For more advanced PowerShell examples, check out the following guide (older but still relevant):
https://adameyob.com/2016/03/22/powershell-custom-inventory-rules-for-dell-kace/

## Scripting and SMA background
These various scripts I have written over the years, whether on my on, with community help, or simple copying someone else's work. Unfortunately, when needing to collect data from my environment, I was less concerned with who wrote the script and more concerned with the data itself. So, unfortunately, I cannot give specific credit where credit is due. Instead, I will give a shoutout to everyone across the globe that have contributed to the SysAdmin/PowerShell/KACE/IT community!

Due to limitations or problems that I would run into with KACE executing certain scripts properly (even with Adam's guide above), I found that encoding PowerShell commands first usually eliminated problems with quotations, brackets, etc. The process of encoding is simple enough and documented in the help of PowerShell itself. If you run PowerShell.exe /? in a prompt, a simple encoding process is explained.

Another limitation is the number of characters that the agent can process in a command. If the command goes beyond 2039 characters (going from memory so could be slightly different), it will drop the remainder of the command. Indentations and long handed commands, which you would typically use for readability (best practice!), will also increase character count. After writing your command properly, you may need to go back and shorten it if it fails.

## What to expect in my scripts
With the above in mind, the scripts may contain one to three variations depending on complexity and how nicely the SMA was treating me. These may include a full (pretty) script with indentations, a shorthand script to reduce characters, and the final command that I used for the Custom Inventory Rule which may also include the encoded PowerShell commands.

Please, never blindly trust and run encoded commands, or any scripts for that matter, before decoding/readying/verifying them yourself. I trust my what I have written but it doesn't mean others should.
