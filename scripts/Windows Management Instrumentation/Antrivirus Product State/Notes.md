The Antivirus Product State is a bit of a mystery. There is, to my knowledge, no official documentation, only community guess work with a little trial and error. Here's an example:
071000

Split this into three bytes:
    First Byte - Options
        07 = Seen with Symantec Endpoint Protection. Combination of features provided by the software such as antivirus, firewall, and autoupdate.
        04 = VMware Carbon Black Cloud. Unkown.
        05 = Norton Security. Unkown.
        06 = Windows Defender. Unkown.

    Second Byte - Status
        00 = Not start or unknown
        10 = Enabled and running.
        20 = Possibly running but not enabled (bypassed)

    Third Byte - Definitions
	    00 = Up to date
	    10 = Out of date


More information can be found scattered across the web.