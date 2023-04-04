// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "./json-deployer.sol";

contract ExampleTest is Test {
	address public adder;

	constructor() {
		adder = new JsonDeployer().deploy("Example.yul/Example.json");
		console.log("deployed to: %s", adder);
	}

	function setUp() public {
		// nothing
	}

	function testAdd() public {
		uint256 a = 123;
		uint256 b = 789;
		(bool success, bytes memory data) = adder.call(abi.encode(a, b));
		assertEq(success, true);
		assertEq(data, abi.encode(uint256(a+b)));
	}
}
