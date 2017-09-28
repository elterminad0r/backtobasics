print("The volume is {:.2f}".format(reduce(float.__mul__, (float(input("Enter the {} : ".format(dim))) for dim in ["length", "width", "height"]))))
