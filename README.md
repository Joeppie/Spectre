# Spectre
Build ghostly, haunted, impervious,  near-weightless and non-corporeal.. rather spectral ships in Avorion.



So, what does this do?

In short, it makes ships pass-through, impervious to weapons fire, reduces their mass, gives near-infinite crew, makes shields regenerate energy and drain shields (which removes shields entirely.. who needs em anyways.)

Yes. It does all these things.
On a per-blocktype basis, the decision is made whether to make it an anti-block, or just a pass-through block.

## Dimensions
Let us talk of dimensions. No, not the ones where species 8472, the Sphere Builders, or the Kromagg live;
Dimensions of a ship, along x, y and z.

In avorion, if something is of the dimensions 0,0,0; it doesn't have a hitbox. Likewise, if somehow you had a block that was -1,0,0
in size, it would not exist.

Now, it gets interesting when a block is negative in one dimension, but positive in the other two...
This block would have an observable size, but it would be pass-through. It would not be susceptible to collision, and act opposite to how the block would act if it was positive by merit of its negative mass.

## Volume

What is volume? It is defined by mulitplying the width x height x depth of an object. e.g. if a block is 10x10x10, the volume is 1000³.

But.. what happens if we are dealing with a block of.. say -10x-10x-10.. the volume is -1000³, in Avorion.

Since many blocks, such as crew quarters and shields derive their statistics from volume; these can be flipped.
* Negative volume Crew quarters reduce the amount of crew available, yield power and reduce mass. (Oh, did I mention that if you have -5 crew in crew quarters in total, the game performs arithmetic overflow and provides you the maximum possible crew capacity?)
* Negative volume Shield generators reduce the amount of shield, yield power, and reduce mass. (Who needs shields; you cannot be hit if you have no blocks have positive dimensions...)
* volume determines credit cost; any block with fully negative dimensions yields money when building; it reduces ship cost.
* fully negative blocks have a fixed resource cost of 1, irrespective of size.




But what if we want a block to have positive volume, but still cannot be hit? hmm

-10x-10x10 => 1000³ volume.

this allows for business as usual with cargo bays, engines, generators and hyperspace cores. Well; that is any business that doesn't involve hitboxes or colissions.

## What does spectre do?

Spectre.xslt makes all blocks pass-through.
Spectre chooses to give blocks positive volume when it makes sense, and gives them negative volume when it does not:

* Stone is made negative, so it can be used to reduce ship mass.
* Crew quarters are made negative to provide for arithmetic overflow; causing near-infinite crew capacity.
* Shields are made negative. Who needs em when you can't be hit; better to have negative cost/mass and free energy.
* Holograms are left entirely unaltered **so that turrets may be placed onto them**- they are already pass-through.
* Hyperspace core, cargo, hangars etc. are kept positive-volume for correct operation.


## Conclusion

Correct exploitation of the described characteristics, which can be partially facilitated on existing ship designs using the provided spectre.xslt, allows for fully immortal, undefeatable, cheap and extremely agile vessels.
This is entirely gamebreaking.. and somewhat hillarious, if not grievously abused.

Use at your own peril, please do not exploit this to cause disturbances, if you use it in multiplayer, do not use it to gain a competitive advantage. Do not use this on PvP servers.
Be responsible.
