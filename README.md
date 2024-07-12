# Meteor Ad-Hoc Chat

A simple, secure, and easy-to-use chat application built with [Meteor.js](https://meteor.com). This project demonstrates the power of real-time web applications using [DDP](https://github.com/meteor/meteor/blob/master/packages/ddp/DDP.md) (Distributed Data Protocol).

This project was primarily developed for academic and demonstration purposes, but it also has potential for real-world applications. It is designed to be easily extensible, allowing those interested to enhance its capabilities or integrate it into existing solutions.

In an era where privacy intrusion is absolute – to the extent of automatically understanding the essence and details of conversations using artificial intelligence technologies, companies and individuals seek alternative ways to create secure and private communication channels. The simplest solution is to install open-source systems on privately owned servers. The project presented below can be installed in such an environment.

## Demo

A demo is available at: [https://ad-hoc-chat.meteorapp.com/](https://ad-hoc-chat.meteorapp.com/) (kindly hosted on [Galaxy](https://www.meteor.com/cloud))

## Features

- Instant messaging in real-time
- Create and join chat rooms with unique URLs
- No registration required - just pick a nickname and start chatting
- Responsive design - works on desktop and mobile devices
- Easy to deploy and customize
- Easy to integrate into existing applications as an iframe, to give them chat channels.

## Getting Started

### Prerequisites

- [Meteor](https://www.meteor.com/install)

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/theosp/meteor-ad-hoc-chat-demonstration.git
   cd meteor-ad-hoc-chat-demonstration
   ```

2. Install dependencies:
   ```
   meteor npm install
   ```

3. Run the application:
   ```
   meteor
   ```

4. Open your browser and navigate to `http://localhost:3000`

## Usage

1. Click "Create New Chat Room" on the home page
2. Choose a nickname
3. Set a name for your chat room
4. Share the unique URL with others to invite them to the chat
5. Start chatting!

## Integration

You can easily integrate this chat application into existing web applications using an iframe. Here's how:

1. Deploy your Meteor Ad-Hoc Chat application.

2. In your existing application, add an iframe with the source URL pointing to your deployed chat application:

   ```html
   <iframe 
     src="https://ad-hoc-chat.meteorapp.com/your-channel-id" 
     width="100%" 
     height="500px" 
     frameborder="0">
   </iframe>
   ```

3. Replace `https://ad-hoc-chat.meteorapp.com/your-channel-id` with the actual URL of your deployed chat application and the desired channel ID (You can derive the channel ID from the page parameters to create a unique channel for every page where you integrate it. For example, if your page URL contains a unique identifier for each page, you can use that identifier as the channel ID).

4. Adjust the `width` and `height` attributes as needed to fit your application's layout.

This allows you to embed chat functionality into any web application with a minimal effort.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

* [Daniel Chcouri](https://www.linkedin.com/in/danielchcouri/)

## Sponsored by

* JustDo.com ([A Source Available Project Management Software](https://JustDo.com))
* MeteorSpark.com ([a Meteor Consultancy](http://Meteorspark.com))

## Acknowledgments

- [Meteor.js](https://www.meteor.com/) for the fantastic full-stack JavaScript platform
- The Meteor community for their continuous support and inspiration

