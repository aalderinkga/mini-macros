
#@ File (label = "Input directory", style = "directory") input
#@ File (label = "Output directory", style = "directory") output
#@ String (label = "File suffix", value = ".tif") suffix

open(input);
run("Stack to Images");	

processFolder(input);

// function to scan folders/subfolders/files to find files with correct suffix
function processFolder(input) {
	list = getFileList(input);
	list = Array.sort(list);
	for (i = 0; i < list.length; i++) {
		if(File.isDirectory(input + File.separator + list[i]))
			processFolder(input + File.separator + list[i]);
		if(endsWith(list[i], suffix))
			processFile(input, output, list[i]);
	}
}

function processFile(input, output, file) {
	print("Processing: " + input + File.separator + file);
	selectWindow(list[i] + ":1");
	setMinAndMax(434, 5019);
	selectWindow(list[i] + ":2");
	setMinAndMax(200, 3044);
	selectWindow(list[i] + ":3");
	setMinAndMax(811, 28893);
	run("Merge Channels...", "c1=" + list[i] + ":1" + " c2=" + list[i] + ":2"+ " c3=" + list[i] + ":3"+ " create");
	selectWindow("Composite");
	print("Saving to: " + output);	
	saveAs("Tiff", output + File.separator + list[i]);
	close();
}

