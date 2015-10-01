function closeblocks(previndentation, indentation) {
	for (j = length(previndentation) - 1; j >= length(indentation); j --) {
		delete last[j];
		print substr(previndentation, 0, j) "}";
	}
}

BEGIN {
	FS = "/";
	print "project=$PWD {";
}

{
	indentation = " "
	# first skip common prefix
	for (i = 1; i < NF; i ++) {
		if (!(i in last) || last[i] != $i) break;
		indentation = indentation " ";
	}
	# close the still open sections
	closeblocks(previndentation, indentation);
	for (; i < NF; i ++) {
		last[i] = $i;
		print indentation $i "=" $i " {";
		indentation = indentation " ";
	}
	print indentation $i;
	previndentation = indentation;
}

END {
	closeblocks(previndentation, "");
}
