# Engineer
iOS Technical Test l Engineer.ai

# Architecture discussion

![Architecture](https://preview.ibb.co/cDX2Uq/Architectre.jpg)

Before starting coding, I brainstorm different architecture. I choose the second option(Table section and row) because both table views and collection views are UIScrollView subclasses and thus don't like to be embedded inside another scroll view as they try to calculate content sizes, reuse cells, etc.
