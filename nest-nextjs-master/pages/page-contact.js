import Layout from "../components/layout/Layout";
import Link from "next/link";
import dynamic from 'next/dynamic';

const Gmap = dynamic(() => import('../components/elements/Gmap'), { ssr: false });

export async function getStaticProps() {
    let users = [];

    try {
        const response = await fetch('http://localhost:3000/api/users1', {
            method: 'GET',
            headers: {
                'x-api-key': 'key0123456789', // Replace with your actual API key
            },
        });

        if (!response.ok) {
            throw new Error('Network response was not ok');
        }

        users = await response.json();
    } catch (error) {
        console.error('Failed to fetch users:', error.message);
    }

    return {
        props: {
            users,
        },
        revalidate: 60, // Optionally revalidate every 60 seconds
    };
}

export function Users({ users }) {
    return (
        <div>
            <h1>User List</h1>
            <ul>
                {users.map((user) => (
                    <li key={user.user_email}>
                        {user.user_fname} {user.user_lname} - {user.user_email} <br />
                        Created At: {new Date(user.created_at).toLocaleString()} <br />
                        Updated At: {new Date(user.updated_at).toLocaleString()}
                    </li>
                ))}
            </ul>
        </div>
    );
}

export default function Contact({ users }) {
    return (
        <>
            <Layout parent="Home" sub="Pages" subChild="Contact">
                <div className="page-content pt-50">
                    <div className="container">
                        <div className="row">
                            <div className="col-xl-10 col-lg-12 m-auto">
                                <section className="row align-items-end mb-50">
                                    <div className="col-lg-4 mb-lg-0 mb-md-5 mb-sm-5">
                                        <h4 className="mb-20 text-brand">How can help you ?</h4>
                                        <h1 className="mb-30">Let us know how we can help you</h1>
                                        <p className="mb-20">Let us know how we can assist you. At Knotsnbees, we're dedicated to providing exceptional service and support for all your event needs.</p>
                                        <p></p>
                                    </div>
                                    <div className="col-lg-8">
                                        <div className="row">
                                            <div className="col-lg-6 mb-4">
                                                <h5 className="mb-20">01. Event Planning Feedback</h5>
                                                <p>Share your feedback on our event planning services. Your insights help us improve and ensure we deliver the best possible experience for every event.</p>
                                            </div>
                                            <div className="col-lg-6 mb-4">
                                                <h5 className="mb-20">02. Customized Service Packages</h5>
                                                <p>Explore our customizable service packages designed to fit your unique event requirements. We offer tailored solutions to match your vision and budget.</p>
                                            </div>
                                            <div className="col-lg-6 mb-lg-0 mb-4">
                                                <h5 className="mb-20 text-brand">03. Billing Inquiries</h5>
                                                <p>Have questions about billing or need assistance with payments? Our team is here to provide clarity and support for all your financial queries.</p>
                                            </div>
                                            <div className="col-lg-6">
                                                <h5 className="mb-20">04. General Inquiries</h5>
                                                <p>For any other questions or information, feel free to reach out. We're here to assist with all aspects of your event planning journey and ensure a seamless experience.</p>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                    <section className="container mb-50 d-none d-md-block">
                        <div className="border-radius-15 overflow-hidden">
                            <div id="map-panes" className="leaflet-map">
                                <Gmap />
                            </div>
                        </div>
                    </section>
                    <div className="container">
                        <div className="row">
                            <div className="col-xl-10 col-lg-12 m-auto">
                                <section className="mb-50">
                                    <div className="row mb-60">
                                        <div className="col-md-4 mb-4 mb-md-0">
                                            <h4 className="mb-15 text-brand">Office</h4>
                                            D-188 Sector 10 <br />
                                            Noida, 201301, INDIA<br />
                                            <abbr title="Phone">Phone:</abbr> +918470804805<br />
                                            <abbr title="Email">Email: </abbr>contact@knotsnbees.com<br />
                                            <a className="btn btn-sm font-weight-bold text-white mt-20 border-radius-5 btn-shadow-brand hover-up"><i className="fi-rs-marker mr-5"></i>View map</a>
                                        </div>
                                        <div className="col-md-4 mb-4 mb-md-0">
                                            <h4 className="mb-15 text-brand">Studio</h4>
                                            205 North Michigan Avenue, Suite 810<br />
                                            Chicago, 60601, USA<br />
                                            <abbr title="Phone">Phone:</abbr> (123) 456-7890<br />
                                            <abbr title="Email">Email: </abbr>contact@Evara.com<br />
                                            <a className="btn btn-sm font-weight-bold text-white mt-20 border-radius-5 btn-shadow-brand hover-up"><i className="fi-rs-marker mr-5"></i>View map</a>
                                        </div>
                                        <div className="col-md-4">
                                            <h4 className="mb-15 text-brand">Shop</h4>
                                            205 North Michigan Avenue, Suite 810<br />
                                            Chicago, 60601, USA<br />
                                            <abbr title="Phone">Phone:</abbr> (123) 456-7890<br />
                                            <abbr title="Email">Email: </abbr>contact@Evara.com<br />
                                            <a className="btn btn-sm font-weight-bold text-white mt-20 border-radius-5 btn-shadow-brand hover-up"><i className="fi-rs-marker mr-5"></i>View map</a>
                                        </div>
                                    </div>
                                    <div className="row">
                                        <div className="col-xl-8">
                                            <div className="contact-from-area padding-20-row-col">
                                                <h5 className="text-brand mb-10">Contact form</h5>
                                                <h2 className="mb-10">Drop Us a Line</h2>
                                                <p className="text-muted mb-30 font-sm">Your email address will not be published. Required fields are marked *</p>
                                                <form className="contact-form-style mt-30" id="contact-form" action="#" method="post">
                                                    <div className="row">
                                                        <div className="col-lg-6 col-md-6">
                                                            <div className="input-style mb-20">
                                                                <input name="name" placeholder="First Name" type="text" />
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-6 col-md-6">
                                                            <div className="input-style mb-20">
                                                                <input name="email" placeholder="Your Email" type="email" />
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-6 col-md-6">
                                                            <div className="input-style mb-20">
                                                                <input name="telephone" placeholder="Your Phone" type="tel" />
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-6 col-md-6">
                                                            <div className="input-style mb-20">
                                                                <input name="subject" placeholder="Subject" type="text" />
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-12 col-md-12">
                                                            <div className="textarea-style mb-30">
                                                                <textarea name="message" placeholder="Message"></textarea>
                                                            </div>
                                                            <button className="submit submit-auto-width" type="submit">Send message</button>
                                                        </div>
                                                    </div>
                                                </form>
                                                <p className="form-messege"></p>
                                            </div>
                                        </div>
                                        <div className="col-lg-4 pl-50 d-lg-block d-none">
                                            <img className="border-radius-15 mt-50" src="assets/imgs/page/contact-2.png" alt="" />
                                        </div>
                                    </div>
                                </section>
                                <Users users={users} /> {/* Include the Users component here */}
                            </div>
                        </div>
                    </div>
                </div>
            </Layout>
        </>
    );
}
