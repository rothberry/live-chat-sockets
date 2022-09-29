import { useState } from "react"
import ChatContainer from "./ChatContainer"
import UserLogin from "./UserLogin"

const App = () => {
	const [loggedIn, setLoggedIn] = useState(false)
	const [user, setUser] = useState({})

	if (loggedIn) {
		return <ChatContainer user={user} />
	} else {
		return <UserLogin setLoggedIn={setLoggedIn} setUser={setUser} />
	}
}

export default App
