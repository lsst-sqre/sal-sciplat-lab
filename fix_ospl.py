#!/usr/bin/env python3


def main():
    configdir = "/tmp"
    start = False
    inputlines = []
    # It's always going to be trivially small compared to memory
    with open("{}/_helpers.tpl".format(configdir), "r") as ifh:
        inputlines = ifh.readlines()

    outputlines = []
    for l in inputlines:
        if l.find("<OpenSplice>") > -1:
            start = True
        if l.find("</OpenSplice>") > -1:
            outputlines.append(l)
            start = False  # not really needed
            break
        # We're in the right section (Get smarter about outputs if we need to)
        if start:
            k = subinterfaces(l)
            outputlines.append(k)

    with open("{}/ospl-config.xml.new".format(configdir), "w") as ofh:
        for l in outputlines:
            ofh.write(l)


def subinterfaces(l):
    pos = l.find('{{- .Values.networkInterface | default "AUTO" -}}')
    if pos > -1:
        nl = l[:pos] + "net1" + "</NetworkInterfaceAddress>\n"
        return nl
    else:
        return l


if __name__ == "__main__":
    main()
