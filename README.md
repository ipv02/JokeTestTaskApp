# Test Task Application
## Description
### En

Make an application through a 3-screen storyboard. 

The first one is the start screen with 2 buttons that must be animated (the application starts - there is nothing,
the transparency of the buttons decreases to zero - they appear + move from the bottom to the center).
Also on the first screen, make a UIImageView and load a random picture from the Internet there. That is, in the code, create an array of 5-10 URL addresses
of images of some kind and each time this screen appears, load the random one into the UIImageView.

The first button should display a random joke with the API. New every time. It should be displayed on a new screen by modal popup.
On the second button, open a screen with a table, which should be filled with 10 jokes from the same API, there is a method for getting several at a time.
When scrolling down to the bottom, load 10 more jokes.

The appearance of the table cells is any, the main thing is to see the ID, type, setup and punchline in more than one Label. It all comes in the API response. 

Keep all jokes while the application is running. 
That is, if the server is available (there is Internet), we load only fresh 10, if there is no network, there should be all the jokes that were loaded before.
You can use frameworks, but it would be better without them. It is necessary to write a small database for offline access to already loaded jokes.

### Rus
Сделать приложение через сториборд на 3 экрана. 

Первый - стартовый экран с 2 кнопками, которые должны быть анимированы (стартует приложение - ничего нет,
прозрачность кнопок уменьшается до нуля - появляются + выезжают с низа в центр).
Также на первом экране сделать UIImageView и загрузить туда рандомную картинку с Интернета. То есть в коде создать массив из 5-10 URL адресов
картинок каких-нибудь и каждый раз при появлении этого экрана грузить рандомную в UIImageView.

По первой кнопке должна выдаваться рандомная шутка с API. Каждый раз новая. Выдаваться она должна на новом экране путем modal popup.
По второй кнопке открывать экран с таблицей, которая должна заполниться 10 шутками с того же API, там есть метод получения нескольких за раз.
При пролистывании до низа подгрузить еще 10 шуток.

Внешний вид ячеек таблицы любой, главное чтобы было видно ID, тип, сетап и панчлайн не в одном Label. Это все приходит в ответе API.

Все шутки хранить, пока приложение работает. То есть если сервер доступен (есть Интернет) - грузим только свежие 10, если нет сети, 
там должны быть все шутки, которые загрузились до этого. Фреймворки использовать можно, но лучше будет без них.
Необходимо написать небольшую БД для оффлайн-доступа к уже загруженным шуткам. 

## Result
<p align="center">
<img src="https://github.com/ipv02/JokeTestTaskApp/blob/main/ScreenGif.gif" /></p>

## API
[Official Joke API](https://github.com/15Dkatz/official_joke_api)  
 

## What did I use
- [x] UIKit;
- [x] AutoLayout;
- [x] Storyboards;
- [x] CoreAnimation;
- [x] Networking;
- [x] UserDefaults
- [x] More than one screen; 
- [x] Table view cell customization

## Addition
Task not completed.
Data storage and prefetching and pagination needed
