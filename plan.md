# One Piece Task List
Disclaimer: all instructions/plans are loose. I don't really care what happens as long as it makes sense. You feel?
- FIX XML. This can likely be done using REGEX. 
    - (Find: ``</say>\n</d>\n<d>\n<speaker>``)
    - (Replace: ``</say>\n<speaker>``)
   
    Should work in theory...
    - (OPTIONAL) replace ``<d>`` tag with something more appropriate? ``<qna>`` maybe I dont know.
    - ADDITIONALLY. Fix ``<info>`` tags. Can be done by manually search and replacing each one via regex. There's probably an easier way but my head is pounding and I cannot think straight. Change them to ``<say>`` tags. Alternatively, change all ``<info> and <say>`` tags to ``<content>`` tags. Shrug emoji. I don't particularly care, as long as it makes sense.


- SVG VISUALIZATION. Likely in the form of bar graphs, but we will see. 
- PYTHON. Count the number of times a character is mentioned PER ``<d> or <qna>`` TAG (whichever version we decide upon). 
    - NAMES TO ACCOUNT FOR
    - Luffy, Zoro, Nami, Usopp, Sanji, Chopper, Robin, Going Merry
- XSLT. Do this post-fixing XML. I'll update more later.
