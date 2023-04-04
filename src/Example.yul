object "Example" {
code {
	datacopy(0, dataoffset("Runtime"), datasize("Runtime"))
	return(0, datasize("Runtime"))
}
object "Runtime" {
	code {
		calldatacopy(0x40, 0x0, 0x40)
		mstore(0x0, add(mload(0x40), mload(0x60)))
		return (0x0, 0x20)
	}
}
}
