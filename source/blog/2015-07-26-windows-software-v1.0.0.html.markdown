---
title: Windows Software v1.0.0
date: 2015-07-26
author:
    name: Adam Walsh
    title: Windows Software Engineer
    pic: adam
---

If you're a part of our community on Reddit found @ [/r/antumbraglow](http://www.reddit.com/r/antumbraglow) you've
probably seen us talking about the Windows software and our plans for it.  Recently I (Adam, Windows SE) have been working
on the v0.3.0 release which re-works our approach to gathering the screen information to reduce the load placed on a crucial
bottle-neck in the software system that we cannot control.  This bottle-neck, for those of you interested, is the
[Windows GDI+ system](https://msdn.microsoft.com/en-us/library/ms533798%28v=vs.85%29.aspx) which is responsible for
allowing Windows software to interact with graphics hardware.  The performance boost planned for v0.3.0 will allow devices
to better work together and share screen information to reduce the frequency the software would need to poll.  However,
after working on and attempting to bend the current software structure around this requirement it is clear the software
project will benefit more from a re-working of the design.

You may have noticed our software currently has a somewhat strange
version number (v0.2.9).  This is done on purpose as to conform to [Semantic Versioning](http://semver.org/spec/v2.0.0.html)
being pre v1.0.0 means that our software is still going through rapid and sometimes experimental changes.  However in the past month
our requirements for the software have solidified allowing us the means to prepare the codebase for more stable development.
Over the past couple weeks I have worked on re-designing the software to allow us to more easily achieve the key functionality
that you, the users, have specified to us.

The new design will be implemented immediately instead of continuing to work around the design to achieve the new screen grab
procedure.  In addition, I have taken into consideration the ideas for new features, that you all have shared with us,
while creating the new design to ensure they will fit well with the new system.  Once the
codebase tune-up is complete we will release v1.0.0 and start on these enhancements.  Another aspect of v1.0.0 that will
released is more in-depth documentation, including instructions for making your own distributable Glow extension
and contributing to the Wintumbra codebase.

Happy glowing, feel free to reach out to us at contact@antumbra.io if you have any questions. :)
