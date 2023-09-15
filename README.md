# Wutz!

Wutz is a daily social trivia game using an API scrapping Jeopardy Productions trivia. [^1]
[^1]: This is not associated with jeopardy productions, inc.

## Developed using

* Rails 7.0.X
* API https://jservice.io/

## Gameplay

Three categories are randomly chosen and will have 3 questions from said categories that increase in difficulty.
Questions are given a point value (1, 2, 3) based on the difficulty of the question. Players do not see the questions but can see the point value.
Once a tile is selected the player is presented with a question which they can then make a guess and submit their answer, or can skip the question.
For each question correct the player gains a number a points equal to the quesitons difficulty while getting the question wrong subtracts points.
The game is played to see how many points you can get after all questions are attempted.

## Interface

Players are presented with a fresh gameboard each day.

![fresh_gameboard](https://user-images.githubusercontent.com/124849657/267852573-f8f1b3b7-646b-484b-88aa-06cc73d4cbf5.png)

Players then can select a tile to recieve a question and submit an answer.

![fresh_gameboard_360](https://user-images.githubusercontent.com/124849657/267853543-67ba379f-2e8c-40e5-bae1-9617c675c7c9.png)
![question_1_480](https://user-images.githubusercontent.com/124849657/267853574-0cf55f7a-918f-4cdc-8a02-bdcc7b8fef2c.png)

Tiles turn green if correct, yellow if skipped, and red if incorrect

![question_right_skipped_wrong_360](https://user-images.githubusercontent.com/124849657/267853847-30f146a7-9a1d-4001-880c-12e324761a73.png)