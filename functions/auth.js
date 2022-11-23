const createTheUser = async (data, auth, store) => {
  try {
    const { email, password, name } = data;

    const result = await auth.createUser({
      email,
      password,
      displayName: name,
    });
    data.uid = result.uid;
    delete data.password;

    // await auth.setCustomUserClaims(result.uid, {
    //   role: data.role,
    // });
    return await createUserInFStore(data, store);
  } catch (err) {
    console.log("errcde", err.errorInfo);
    return {
      status: "error",
      payload: err.errorInfo,
    };
  }
};

const createUserInFStore = async (data, store) => {
  try {
    const tmstp = +new Date();
    data.createdAt = tmstp;

    await store.collection("users").doc(data.uid).create(data);

    return {
      status: "success",
      payload: data,
    };
  } catch (err) {
    return {
      status: "error",
      payload: {
        code: err.code,
        message: err.details,
      },
    };
  }
};

module.exports = createTheUser;
