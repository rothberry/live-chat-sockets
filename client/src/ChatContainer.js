import { useEffect, useState } from "react"
import ChatBox from "./ChatBox"
import ActionCable from "actioncable"

const ChatContainer = ({ user }) => {
	const [messages, setMessages] = useState([])
	const cable = ActionCable.createConsumer("ws://localhost:28080/cable")

	useEffect(() => {
		createSubsciption()
	}, [])

	useEffect(() => {
		console.log({ cable })
	}, [cable])

	const createSubsciption = () => {
		cable.subscriptions.create(
			{
				channel: "MessagesChannel",
			},
			{ received: (message) => addMessage(message) }
		)
	}

	const addMessage = (newMessage) => {
		setMessages([...messages, newMessage])
	}
	return (
		<>
			<div>
				<ul>
					{messages.map((message) => {
						return <li>{message}</li>
					})}
				</ul>
				<ChatBox user_id={user.id} addMessage={addMessage} />
			</div>
		</>
	)
}

export default ChatContainer
