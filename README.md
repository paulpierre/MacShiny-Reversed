# MacShiny-Reversed
MacShiny is a purported "cleaner", "anti-virus", "anti-theft", "anti-malware" (a la MacKeeper)
app which appears to be promoted in pop-under ad networks.

# Files
"Double click to install.pkg" is the dropper, "InstallerHelper" is the package contents which drops
MacShinyFull found in "MacShinyFull-SOURCE" which among MacShiny installs a few other Applications

Everything is written in Angular via Xamarin Framework.

The company's entire stack is .ASP NET. This was just a cursory dive into their code.

Full source available and unminified in the repo.

# Notes

Some friendly tips, to deflate a .pkg file simply run xar -xf MacShinyFull.pkg which will
drop everything in the working directory, often times when you encounter another PKG it could
also be a directory.

In the present working directory unzip the files Scripts and Payload via:

cat Scripts | gunzip -dc |cpio -i;cat Payload | gunzip -dc |cpio -i
