// this function opens all (IOB) files in the selected input folder and saves them as TIFF files in the selected output folder
// line 4 can be adjusted to change the options (eg: autoscale)
function action(input, output, filename, savename) {
	run("Bio-Formats Importer", "open=[filename] autoscale color_mode=Default view=Hyperstack stack_order=XYCZT");
	saveAs("Tiff", savename);
        close();
}

// get the input and output directory
input = getDirectory("Input directory");
output = getDirectory("Output directory");

// get the filenames
list = getFileList(input);
for (i = 0; i < list.length; i++)
        action(input, output, input+list[i], output+list[i]);
