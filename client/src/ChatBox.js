import { useState } from "react"

const ChatBox = ({ user_id, addMessage }) => {
	const [content, setContent] = useState("")

	const handleMessage = (e) => {
		e.preventDefault()
		fetch("messages", {
			method: "POST",
			headers: {
				"content-type": "application/json",
			},
			body: JSON.stringify({ content, user_id }),
		}).then((_data) => {
			console.log("Sent message")
			addMessage(content)
		})
	}

	return (
		<div>
			<form onSubmit={handleMessage}>
				<input
					placeholder="Start Typing"
					value={content}
					onChange={(e) => setContent(e.target.value)}
				/>
				<input type="submit" value={"SEND"} />
			</form>
		</div>
	)
}

export default ChatBox
