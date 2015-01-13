---
title: A Brief Glow Hardware Overview (Beta)
date: 2015-01-13
author:
    name: Davis Foster
    title: Hardware Engineer
    pic: davis
---

As we get closer to launch, we’re going to be releasing more and more material detailing exactly how the device works.  Most of the documentation will be software-related, as the hardware is built for the consumer and not exactly “hacker” friendly, but expect a release of all hardware source soon, as well as a DIY guide as to how to build your own Glow on a breadboard (or protoboard, if you’re the soldering type)!  This first post won’t be too technical (it should at least be readable to the average user), but it’ll have some jargon and contain mostly information that isn’t very useful to the typical consumer - just a heads up!


First, let’s start off with a high-level overview.  Glow is effectively a high-brightness RGB LED coupled with a fairly simple 8-bit microcontroller and packaged in a user-friendly manner that integrates via USB.  The AVR MCU (an ATMega16U4) has a built-in full-speed USB slave controller that allows us to interface with the PC or Mac as a HID device.  This is the same type of interface used a keyboard or mouse, so the host software can communicate colors and other information to the device faster than perceptible by the user (as opposed to software serial or the like, which often are too restrictive for fluid user interaction).


The actual LED is a high-brightness model from SUNLED or Kingbright (both offer the same exact LED, save for some minor binning and characterization differences), but it’s unclear to us if they both are licensed to produce the same design, or if they’re simply reselling the same part after it came off another fab).  We push just under 150mA through each color channel (R,G,B) at 5v, for a combined power total of 2.25w.   This gives us a nice safety margin under the USB2 output standard of 500mA (2.5w), which we request during USB enumeration with the device.   Unfortunately, the are some drawbacks to using such a bright LED and sipping so much (in relative terms) power - the actual Glow device does get pretty hot when used at full brightness.  Unlike incandescent bulbs, which “burn” the majority of their energy as radiated infrared light, LEDs burn excess power in heat that has to be conducted away from the emitter itself.  Luckily, the thermal properties of the LED are relatively self-limiting, we’ve designed the parts to be able to safely take the heat (which gets to around 160F, or 71C), and have also taken steps in software (with temperature management) to prevent thermal runaway.


As for illumination itself, the LED emits a right-circular cone of light with an apex angle of approximately 160 degrees after taking body-occlusion (caused by light being blocked by the chamfer in the plastic case) into consideration.  This means that the angle of incidence with respect to the height of the cone and the outer-edge of light emission is 80 degrees.  From this, we can construct the equation (tan(80) * L) - (W /2) = H to find out the length of the visible light perpendicular to the frame of the monitor, with L being the distance from the rear of your monitor to the wall, W being either the vertical or horizontal length of your monitor, and H being the length of the visible light on a given side of the monitor.  Effectively, this simplifies down to (5.7 * DistFromWall) - (MonitorWidth / 2) = (Visible Exposure Length).  On a typical 21” desktop monitor one foot for the wall, the maximum distance light will be visible (measured from the edge of the screen) will be about 57 inches.


Unfortunately, the LED emission pattern isn't flat across it's viewing angle - meaning that the intensity of light is going to be more powerful in the center and weaker around the edges.  Redoing the calculation with tan(50) substituted for tan(80) (1.2 instead of 5.7) will net the distance from the edge of your monitor at which the intensity of light is approximately 50% of what it is dead center, which is significantly more than acceptable when using Glow in a dark room.  From our own usage, when this point is positive (that is, beyond the edge of the monitor frame) in the horizontal direction, Glow can be used optimally.  On a typical 21” desktop monitor one foot from the wall, the point of 50% brightness is about 3.5” away from the horizontal edges of the monitor - a great experience.  We’ll probably deliver a more detailed post on this soon.


For those of you who are looking to hardware hack, here’s a quick-and-dirty rundown:  LED driven by PWM though 3 low-RdsON N-channel MOSFETs.  Vdd = 5v, protected by a 1.5a PTC fuse.  Connector:  MicroUSB-B, power and data.  Board size:  30mm x 30mm, 2-layer FR4.  MCU:  ATMega16U4, QFN package.  Smallest passive: 0603.  Largest passive:  1206.  Rated temp:  85C.  Nominal Operating Range:  0C-75C.  LED Output:   10.7lm Red, 12lm Green, 2.9lm Blue.  Max colors: 16 million (8-bit PWM on each channel).  Plastic type:  Sintered nylon.


Check back for more updates.
