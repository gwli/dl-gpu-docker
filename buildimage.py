#!/usr/bin/env python2
import argparse
import os

img_list = [
    ("tensorflow","1.4.0"),
    ("chainer","3.1.0"),
    ("mxnet","0.11"),
    ("pytorch","0.2.0"),
    ("cntk","2.3"),
]


def main(args):
    for (name,version) in img_list:
        if args.dl == "all" or args.dl == name:
    
            tagname = "nvdevtools/{}:{}-cuda-8.0".format(name,version)
            if args.f:
               cmd = "nvidia-docker build -t {0}-f -f Dockerfile.{1}_f . && docker push {0}-f".format(tagname,name)
            else:
               cmd = "nvidia-docker build -t {0} -f Dockerfile.{1} . && docker push {0}".format(tagname,name)
            print cmd
            os.system(cmd)
    
        else:
           pass


if __name__ == "__main__":
    
    parser = argparse.ArgumentParser(description="deeplearn machine prepre")
    parser.add_argument('-f',help='full base or not',action='store_true',default=False)
    parser.add_argument('--dl',type=str,help="dl frameworks:tensorflow/pytorch/cntk/mxnet/chainer/all",required=True,default="all")
    args = parser.parse_args()
    main(args)

