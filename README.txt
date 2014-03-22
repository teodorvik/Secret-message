GENERATE A HIDDEN MESSAGE
generateMessage('image_you_want_to_hide_a_message_in', 'the_message') 
The read function can only handle grayscale images. The generator converts it for you. Save as a .png!

Variables in generateMessage()
columnDist = 13;                % determines the length between each column with hidden characters
howMany = 14;                   % How many charpixels in each column
rowDist = floor(Y/howMany);     % length to next charpixel in the column


READ THE HIDDEN MESSAGE 
readMessage('image_with_hidden_message') 
Will return the message
