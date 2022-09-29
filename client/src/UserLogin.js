import React, { useState } from "react"

const UserLogin = ({ setUser, setLoggedIn }) => {
	const [name, setName] = useState("")

	const handleSubmit = (e) => {
		e.preventDefault()
		fetch("users", {
			method: "POST",
			headers: {
				"content-type": "application/json",
			},
			body: JSON.stringify({ name, status: "online" }),
		})
			.then((r) => r.json())
			.then((data) => {
				console.log(data)
				setUser(data)
				setLoggedIn(true)
			})
	}
	return (
		<div>
			UserLogin
			<form onSubmit={handleSubmit}>
				<input value={name} onChange={(e) => setName(e.target.value)} />
				<input type="submit" value="LOG" />
			</form>
		</div>
	)
}

export default UserLogin
