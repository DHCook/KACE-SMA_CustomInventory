## Windows Feature Blocks - SdbEntries

SdbEntries refer to compatibility database entries used by the Windows App Compatibility Infrastructure. Though under the 'GWX' (Get Windows 10) subkey, these entries are also related to compatibility information for Windows 10 Feature Updates.

For a great article on Windows 10 Feature Update blocks, check out this blog post by Adam Gross [Demystifying Windows 10 Feature Update Blocks](https://www.asquaredozen.com/2020/07/26/demystifying-windows-10-feature-update-blocks/) and the accompanying PowerShell module [FU.WhyAmIBlocked](https://github.com/AdamGrossTX/FU.WhyAmIBlocked). The module can use the information in the **SdbEntries** to help determine the cause of feature update issues.